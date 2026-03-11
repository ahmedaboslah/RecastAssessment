import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_typography.dart';
import 'package:recasttask/core/themes/app_spacing.dart';
import 'package:recasttask/Features/AuthScreen/widgets/animated_image_section.dart';

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTypography.textTheme(Theme.of(context).colorScheme);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AnimatedImageSection(),
        const SizedBox(height: AppSpacing.p16),
        Text('Welcome to OasisNow', style: textTheme.headlineLarge),
        const SizedBox(height: AppSpacing.p6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p6),
          child: Text(
            'The best cooking and the best care from our professional hands to your plate',
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall,
          ),
        ),
      ],
    );
  }
}
