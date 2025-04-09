import 'dart:io';

import 'package:chicken_mines/common/colors/app_colors.dart';
import 'package:chicken_mines/common/typography/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chicken_mines/gen/assets.gen.dart';
import '../bloc/levels_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
        body: Consumer<LevelsBloc>(
          builder: (_, bloc, __) {
            return StreamBuilder(
                stream: bloc.levelStream,
                builder: (_, snapshot) {
                  if (!snapshot.hasData) return SizedBox();
                  final data = ((snapshot.data??1)-1);
                  print(data);
                  return SafeArea(
                    minimum: EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Image.asset(
                                Assets.icons.clear.path,
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Text(
                                'Game progress ${(data) * 20}%',
                                style: AppTypography.headline1.copyWith(
                                  color: AppColors.purple,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            LinearProgressIndicator(
                              minHeight: 20,
                              borderRadius: BorderRadius.circular(99),
                              value: (data / 100) * 20,
                              backgroundColor: AppColors.purple,
                              color: Color.fromRGBO(32, 24, 42, 0.6),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            if (data > 1)
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.black.withOpacity(0.1),
                                      blurRadius: 10,
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Text(
                                  'Achivements',
                                  style: AppTypography.headline1.copyWith(
                                    color: AppColors.purple,
                                  ),
                                ),
                              ),
                            if (data > 1)SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: [
                                    for (int i = 1; i <= data; i++)
                                      Column(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  Assets.icons.stone.path,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Center(
                                              child: Text(
                                                "$i",
                                                style: AppTypography.headline1.copyWith(
                                                  fontSize: 37,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.purple,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.black.withOpacity(0.1),
                                                  blurRadius: 10,
                                                  spreadRadius: 1,
                                                ),
                                              ]
                                            ),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "lvl\npassed",
                                              style: AppTypography.headline1.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                height: 0.9,
                                                color: AppColors.purple,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ]
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
