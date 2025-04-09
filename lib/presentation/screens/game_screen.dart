import 'dart:math';

import 'package:chicken_mines/common/colors/app_colors.dart';
import 'package:chicken_mines/common/typography/app_typography.dart';
import 'package:chicken_mines/gen/assets.gen.dart';
import 'package:chicken_mines/presentation/bloc/levels_bloc.dart';
import 'package:chicken_mines/presentation/bloc/quiz_bloc.dart';
import 'package:chicken_mines/presentation/screens/result_screen.dart';
import 'package:chicken_mines/presentation/uikit/pause_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class GameScreen extends StatelessWidget {
  final int gridSize;

  const GameScreen({
    Key? key,
    required this.gridSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<GameBloc>(
      create: (_) => GameBloc(gridSize),
      builder: (_, __) {
        return Consumer<GameBloc>(
          builder: (_, bloc, __) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.icons.bg.path,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  minimum: EdgeInsets.symmetric(
                    horizontal: 23,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Assets.icons.egg.path,
                              width: 28,
                              height: 37,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            StreamBuilder(
                                stream: bloc.scoreStream,
                                builder: (_, snap) {
                                  if (!snap.hasData) return SizedBox();
                                  final data = snap.data ?? 0;
                                  return Text(
                                    '$data',
                                    style: AppTypography.headline1.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.purple,
                                    ),
                                  );
                                }),
                            Spacer(),
                            GestureDetector(
                              onTap: () => showDialog(
                                context: context,
                                builder: (_) => PauseDialog(),
                                useSafeArea: false,
                              ),
                              child: Image.asset(
                                Assets.icons.pauseDialog.path,
                                width: 50,
                                height: 50,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Expanded(
                          child: _buildGrid(
                            context,
                            bloc,
                          ),
                        ),
                        SizedBox(height: 20),
                        StreamBuilder<int>(
                          stream: bloc.scoreStream,
                          builder: (context, snapshot) {
                            return Text(
                              '${snapshot.data ?? 0}',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGrid(BuildContext context, GameBloc bloc) {
    return StreamBuilder<List<List<bool>>>(
      stream: bloc.revealedCellsStream,
      builder: (context, revealedSnapshot) {
        final revealedCells =
            revealedSnapshot.data ?? List.generate(gridSize, (_) => List.generate(gridSize, (_) => false));

        return StreamBuilder<List<List<bool>>>(
          stream: bloc.mineFieldStream,
          builder: (context, mineSnapshot) {
            final mineField =
                mineSnapshot.data ?? List.generate(gridSize, (_) => List.generate(gridSize, (_) => false));

            return Consumer<LevelsBloc>(
              builder: (_, lvlBloc, __) {
                return GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: gridSize,
                  ),
                  itemCount: gridSize * gridSize,
                  itemBuilder: (context, index) {
                    int row = index ~/ gridSize;
                    int col = index % gridSize;

                    bool isRevealed = revealedCells[row][col];
                    bool isMine = mineField[row][col];
                    if (isMine) {
                      Vibration.vibrate(
                        duration: 100,
                      );
                    }

                    return GestureDetector(
                      onTap: () {
                        bloc.revealCell(row, col);

                        if (isMine) {
                          showDialog(
                            useSafeArea: false,
                            context: context,
                            builder: (_) => ResultDialog(
                              score: bloc.score,
                              lvl: gridSize,
                            ),
                          );
                        } else {
                          bool hasWon = bloc.hasWon();
                          if (hasWon) {
                            bloc.checkWinCondition(lvlBloc);
                            showDialog(
                              useSafeArea: false,
                              context: context,
                              builder: (_) => ResultDialog(
                                score: bloc.score,
                                lvl: gridSize,
                              ),
                            );
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              Assets.icons.cell.path,
                            ),
                          ),
                        ),
                        child: Center(
                          child: isRevealed
                              ? Image.asset(
                                  isMine ? Assets.icons.egg.path : 'assets/icons/chicken${Random().nextInt(2) + 1}.png',
                                  width: 50,
                                  height: 50,
                                )
                              : Container(),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
