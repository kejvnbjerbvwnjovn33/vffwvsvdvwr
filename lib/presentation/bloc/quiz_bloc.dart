import 'dart:math';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:injectable/injectable.dart';

import 'levels_bloc.dart';

@injectable
class GameBloc {
  final BehaviorSubject<List<List<bool>>> _mineFieldController = BehaviorSubject.seeded([]);
  final BehaviorSubject<List<List<bool>>> _revealedCellsController = BehaviorSubject.seeded([]);
  final BehaviorSubject<int> _scoreController = BehaviorSubject.seeded(0);
  final BehaviorSubject<bool> _gameOverController = BehaviorSubject.seeded(false);

  int gridSize;
  late int mineCount;
  int score = 0;
  late Box<int> _scoreBox;

  GameBloc(@factoryParam this.gridSize) {
    mineCount = _calculateMineCount(gridSize);
    _initHive();
    _initializeGame();
  }

  Stream<List<List<bool>>> get mineFieldStream => _mineFieldController.stream;
  Stream<List<List<bool>>> get revealedCellsStream => _revealedCellsController.stream;
  Stream<int> get scoreStream => _scoreController.stream;
  Stream<bool> get gameOverStream => _gameOverController.stream;

  Future<void> _initHive() async {
    _scoreBox = await Hive.openBox<int>('score');
    _loadScore();
  }

  void _initializeGame() {
    final List<List<bool>> mineField = List.generate(gridSize, (_) => List.generate(gridSize, (_) => false));
    final List<List<bool>> revealedCells = List.generate(gridSize, (_) => List.generate(gridSize, (_) => false));

    _placeMines(mineField);

    _mineFieldController.add(mineField);
    _revealedCellsController.add(revealedCells);
    _gameOverController.add(false);
  }

  void _placeMines(List<List<bool>> mineField) {
    final random = Random();
    int placedMines = 0;

    while (placedMines < mineCount) {
      int row = random.nextInt(gridSize);
      int col = random.nextInt(gridSize);

      if (!mineField[row][col]) {
        mineField[row][col] = true;
        placedMines++;
      }
    }
  }

  int _calculateMineCount(int size) {
    return size - 2;
  }

  void _loadScore() {
    score = _scoreBox.get(0, defaultValue: 0) ?? 0;
    _scoreController.add(score);
  }

  void _saveScore() {
    _scoreBox.put(0, score);
  }

  void revealCell(int row, int col) {
    if (_gameOverController.value) return;

    final mineField = _mineFieldController.value;
    final revealedCells = _revealedCellsController.value;

    if (revealedCells[row][col]) return;

    revealedCells[row][col] = true;

    if (mineField[row][col]) {
      _gameOverController.add(true);
    } else {
      score += 10;
      _scoreController.add(score);
      _saveScore(); // Сохраняем score в Hive
    }

    _revealedCellsController.add(revealedCells);
  }

  void resetGame() {
    _initializeGame();
  }

  void dispose() {
    _mineFieldController.close();
    _revealedCellsController.close();
    _scoreController.close();
    _gameOverController.close();
  }

  void checkWinCondition(LevelsBloc levelsBloc) {
    final mineField = _mineFieldController.value;
    final revealedCells = _revealedCellsController.value;

    bool allSafeCellsRevealed = true;

    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (!mineField[row][col] && !revealedCells[row][col]) {
          allSafeCellsRevealed = false;
          break;
        }
      }
      if (!allSafeCellsRevealed) break;
    }

    if (allSafeCellsRevealed) {
      print("WIN");

      // Получаем текущий уровень из LevelsBloc
      int currentLevel = levelsBloc.currentLevel;

      // Разблокируем следующий уровень
      levelsBloc.unlockLevel(currentLevel + 1);
    }
  }

  bool hasWon() {
    final mineField = _mineFieldController.value;
    final revealedCells = _revealedCellsController.value;

    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        if (!mineField[row][col] && !revealedCells[row][col]) {
          return false;
        }
      }
    }
    return true;
  }
}