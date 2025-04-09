import 'package:chicken_mines/presentation/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:chicken_mines/common/typography/app_typography.dart';
import 'package:chicken_mines/gen/assets.gen.dart';

import '../../common/colors/app_colors.dart';

class ResultDialog extends StatelessWidget {
  final int score;
  final int lvl;
  const ResultDialog({
    super.key,
    required this.score,
    required this.lvl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(32, 24, 42, 0.6),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(
          horizontal: 39,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.icons.gameOver.path,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  Assets.icons.resBoard.path,
                ),
                Padding(padding: EdgeInsets.only(top: 35),child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.icons.egg.path,
                      width: 20,
                      height: 27,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$score',
                      style: AppTypography.headline1.copyWith(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w900,
                        fontSize: 27,
                        color: AppColors.purple,
                      ),
                    ),
                  ],
                ),),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Image.asset(
                    Assets.icons.retry.path,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => GameScreen(
                          gridSize: lvl,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 35,
                ),
                GestureDetector(
                  child: Image.asset(
                    Assets.icons.clear.path,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
