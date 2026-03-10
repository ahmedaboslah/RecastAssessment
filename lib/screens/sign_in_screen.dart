import 'package:flutter/material.dart';
import 'package:recasttask/themes/app_spacing.dart';
import 'package:recasttask/widgets/custom_password_text_field.dart';
import 'package:recasttask/widgets/custom_text_form_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        key: const ValueKey('SignInScreen'),
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hintText: 'Email',
            controller: emailController,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.p6),
          CustomPasswordTextField(
            hintText: 'Password',
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.p6),
          CustomPasswordTextField(
            hintText: 'Re-enter Password',
            controller: confirmPasswordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.p9),
        ],
      ),
    );
  }
}
