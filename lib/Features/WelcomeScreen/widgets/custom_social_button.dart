
import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_colors.dart';
import 'package:recasttask/core/themes/app_radius.dart';
import 'package:recasttask/core/themes/app_spacing.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.textTheme,
    required this.image,
    required this.textButton,
  });

  final TextTheme textTheme;
  final String image;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.background,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.p16),
        minimumSize: const Size(double.infinity, 56),
        side: const BorderSide(color: Colors.white24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r16),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(image, height: 15, width: 15),
            ),
          ),
          Text(textButton, style: textTheme.titleMedium),
        ],
      ),
    );
  }
}
