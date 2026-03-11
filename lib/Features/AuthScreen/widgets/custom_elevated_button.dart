import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_colors.dart';
import 'package:recasttask/core/themes/app_radius.dart';
import 'package:recasttask/core/themes/app_spacing.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.textTheme,
    required this.text,
    required this.color,
    required this.color2,
    required this.textColor,
    this.onPressed,
  });

  final TextTheme textTheme;
  final String text;
  final Color textColor;
  final Color color;
  final Color color2;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: color2 == AppColors.titleColor2
            ? LinearGradient(
                colors: [color, color2],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : LinearGradient(
                colors: [color, color],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.p16),
          minimumSize: const Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r16),
          ),
        ),
        child: Text(
          text,
          style: textTheme.titleMedium!.copyWith(color: textColor),
        ),
      ),
    );
  }
}
