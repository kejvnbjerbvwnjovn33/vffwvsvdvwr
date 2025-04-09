import 'package:chicken_mines/di/di.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:in_app_review/in_app_review.dart';


abstract class InAppReviewService {
  static Future<void> tryRequestReview() async {
    final inAppReview = getIt<InAppReview>();

    if (Hive.box<int>(BoxNames.reviewCount).isOpen == false) {
      await Hive.openBox(BoxNames.reviewCount);
    }

    final shouldShow = Hive.box<int>(BoxNames.reviewCount).values.firstOrNull;
    if ((shouldShow ?? 0) < 3) {
      inAppReview.requestReview();
      _incrementCount();
    } else {
      return;
    }
  }

  static void _incrementCount() {
    Hive.box<int>(BoxNames.reviewCount)
        .put(BoxNames.reviewCount, (Hive.box<int>(BoxNames.reviewCount).values.firstOrNull ?? 0) + 1);
  }
}

abstract class BoxNames{
  static const reviewCount = 'rewCounts';
}