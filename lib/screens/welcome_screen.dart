import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_assets.dart';
import 'package:recasttask/core/resources/app_typography.dart';
import 'package:recasttask/themes/app_spacing.dart';
import 'package:recasttask/widgets/custom_social_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onContinue;

  const WelcomeScreen({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTypography.textTheme(Theme.of(context).colorScheme);

    return Column(
      key: const ValueKey('WelcomeScreen'),
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSocialButton(
          textTheme: textTheme,
          image: AppImages.appleLogo,
          textButton: 'Continue with Apple',
        ),
        const SizedBox(height: AppSpacing.p7),
        CustomSocialButton(
          textTheme: textTheme,
          image: AppImages.googleLogo,
          textButton: 'Continue with Google',
        ),
        const SizedBox(height: AppSpacing.p16),
        Row(
          children: [
            const Expanded(child: Divider(color: Colors.white24)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p16),
              child: Text('or', style: textTheme.labelSmall),
            ),
            const Expanded(child: Divider(color: Colors.white24)),
          ],
        ),
        const SizedBox(height: AppSpacing.p6),
      ],
    );
  }
}
