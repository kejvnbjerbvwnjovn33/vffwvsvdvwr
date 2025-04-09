import 'dart:io';

import 'package:chicken_mines/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chicken_mines/gen/assets.gen.dart';
import 'package:chicken_mines/presentation/bloc/music_bloc.dart';
import 'package:chicken_mines/presentation/screens/settings_screen.dart';

import 'level_map_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
          minimum: EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [  GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => InfoScreen(),
                    ),
                  ),

                  child: Image.asset(
                    Assets.icons.info.path,
                    width: 50,
                    height: 50,
                  ),
                ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: ()=> Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProfileScreen(),
                          ),
                        ),
                        child: Container(
                          width: 70,height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                Assets.icons.stone.path,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Icon(Icons.person,color: Colors.black.withAlpha(80),),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Consumer<MusicBloc>(builder: (_, musicBloc, __) {
                        return GestureDetector(
                          onTap: musicBloc.handleMusic,
                          child: StreamBuilder(
                              stream: musicBloc.isMusicPlay,
                              builder: (_, snap) {
                                if (!snap.hasData) return SizedBox();
                                final isPlay = snap.data ?? false;
                                return Image.asset(
                                  isPlay ? Assets.icons.volumeUp.path : Assets.icons.volumeOff.path,
                                  width: 50,
                                  height: 50,
                                );
                              }),
                        );
                      }),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Image.asset(Assets.icons.startImg.path),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              GestureDetector(
                child: Image.asset(
                  Assets.icons.newGame.path,
                  width: 172,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LevelMapScreen(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),

              GestureDetector(
                child: Image.asset(
                  Assets.icons.exit.path,
                  width: 172,
                ),
                onTap: () => exit(0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
