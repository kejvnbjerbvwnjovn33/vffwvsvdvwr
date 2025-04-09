import 'package:chicken_mines/common/colors/app_colors.dart';
import 'package:chicken_mines/common/typography/app_typography.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? width;

  const AppButton({
    super.key,
    this.onPressed,
    this.width,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.brown,
          borderRadius: BorderRadius.circular(99),
          border: Border.all(
            color: Color.fromRGBO(232, 117, 0, 1),
            width: 2.2,
          ),
        ),
        child: Center(child: Text(
          textAlign: TextAlign.center,
          label.toUpperCase(),
          style: AppTypography.headline1.copyWith(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            color: AppColors.purple,
            fontStyle: FontStyle.italic,
          ),
        ),),
      ),
    );
  }
}
