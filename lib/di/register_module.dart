
import 'package:in_app_review/in_app_review.dart';
import 'package:injectable/injectable.dart';


@module
abstract class RegisterModule {
  @singleton
  InAppReview get inAppReview => InAppReview.instance;
}
