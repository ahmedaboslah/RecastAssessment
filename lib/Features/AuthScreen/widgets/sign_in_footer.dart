import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_colors.dart';
import 'package:recasttask/core/resources/app_typography.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});
    

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTypography.textTheme(Theme.of(context).colorScheme);
    return  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Passwords did not match, try again.', style: textTheme.titleSmall!.copyWith(color: AppColors.warning))
          ],
        );
  }
}