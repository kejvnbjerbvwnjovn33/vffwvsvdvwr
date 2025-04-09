import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chicken_mines/common/colors/app_colors.dart';
import 'package:chicken_mines/common/typography/app_typography.dart';
import 'package:chicken_mines/presentation/bloc/levels_bloc.dart';
import 'package:chicken_mines/presentation/screens/game_screen.dart';

import '../../gen/assets.gen.dart';

class LevelMapScreen extends StatelessWidget {
  const LevelMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: GestureDetector(
                        child:  Image.asset(Assets.icons.chooseLvl.path,width: MediaQuery.of(context).size.width*0.65,),
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),

                  ],
                ),
              ),
              Provider<LevelsBloc>(
                create: (_) => LevelsBloc(),
                builder: (_, __) {
                  return Consumer<LevelsBloc>(
                    builder: (_, bloc, __) {
                      return StreamBuilder(
                          stream: bloc.levelStream,
                          builder: (_, snapshot) {
                            if (!snapshot.hasData) return SizedBox();
                            final levels = snapshot.data ?? 1;
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 100),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 1; i <= 5; i++)
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Wrap(
                                          children: [
                                            Opacity(
                                              opacity: i <= levels ? 1.0 : 0.5,
                                              child: GestureDetector(
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                        Assets.icons.stone.path,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "$i",
                                                      style: AppTypography.headline1.copyWith(
                                                        fontSize: 27,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColors.purple,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () => i <= levels
                                                    ? Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                          builder: (_) => GameScreen(
                                                            gridSize: _gridSelector(i),
                                                          ),
                                                        ),
                                                      )
                                                    : log('locked'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            );
                          });
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _gridSelector(int lvl) {
    switch (lvl) {
      case 1:
        return 3;
      case 2:
        return 4;
      case 3:
        return 5;
      case 4:
        return 6;
      case 5:
        return 7;
      default:
        return 3;
    }
  }
}
