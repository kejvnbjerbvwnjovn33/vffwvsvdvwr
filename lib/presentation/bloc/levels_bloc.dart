import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class LevelsBloc {
  static const String boxName = 'levelBox';
  final _levelsSubject = BehaviorSubject<int>();
  Stream<int> get levelStream => _levelsSubject.stream;

  Box<int>? _levelBox;

  Future<void> _initBox() async {
    _levelBox ??= await Hive.openBox<int>(boxName);
  }

  Future<void> _loadMaxLevel() async {
    await _initBox();
    final maxLevel = _levelBox?.get(0, defaultValue: 1) ?? 1;
    _levelsSubject.add(maxLevel);
  }

  int get currentLevel {
    return _levelsSubject.value;
  }

  Future<void> unlockLevel(int level) async {
    await _initBox();
    int currentMaxLevel = _levelBox?.get(0, defaultValue: 1) ?? 1;

    if (level > currentMaxLevel) {
      await _levelBox?.put(0, level);
      _levelsSubject.add(level);
    }
    _loadMaxLevel();
  }

  LevelsBloc() {
    _loadMaxLevel();
  }

  void dispose() {
    _levelsSubject.close();
  }
}