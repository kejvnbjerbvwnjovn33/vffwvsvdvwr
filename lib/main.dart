import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:chicken_mines/common/services/app_review/review_service.dart';
import 'package:chicken_mines/presentation/bloc/levels_bloc.dart';
import 'package:chicken_mines/presentation/bloc/music_bloc.dart';
import 'package:chicken_mines/presentation/screens/start_screen.dart';

import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox<int>('score');
  await Hive.openBox<int>(BoxNames.reviewCount);


  Future.delayed(const Duration(seconds: 3)).then((_) {
    InAppReviewService.tryRequestReview();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => getIt<MusicBloc>()),
        Provider(create: (_) => getIt<LevelsBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
      ),
    );
  }
}
