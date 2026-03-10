import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_colors.dart';
import 'package:recasttask/core/resources/app_typography.dart';

class WelcomeFooter extends StatelessWidget {
  const WelcomeFooter({super.key, required this.onContinue});
  final VoidCallback onContinue;
  @override
  Widget build(BuildContext context) {
    final textTheme = AppTypography.textTheme(Theme.of(context).colorScheme);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? ', style: textTheme.headlineSmall),
        GestureDetector(
          onTap: onContinue,
          child: Text(
            'Login',
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.titleColor1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
