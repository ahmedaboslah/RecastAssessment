import 'package:flutter/material.dart';
import 'package:recasttask/core/resources/app_colors.dart';
import 'package:recasttask/core/resources/app_typography.dart';
import 'package:recasttask/screens/sign_in_screen.dart';
import 'package:recasttask/screens/welcome_screen.dart';
import 'package:recasttask/themes/app_spacing.dart';
import 'package:recasttask/widgets/auth_app_bar.dart';
import 'package:recasttask/widgets/custom_elevated_button.dart';
import 'package:recasttask/widgets/sign_in_footer.dart';
import 'package:recasttask/widgets/welcome_footer.dart';

class MainAuthScreen extends StatefulWidget {
  const MainAuthScreen({super.key});

  @override
  State<MainAuthScreen> createState() => _MainAuthScreenState();
}

class _MainAuthScreenState extends State<MainAuthScreen> {
  bool showSignIn = false;

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _switchToSignIn() {
    setState(() {
      showSignIn = true;
    });
  }

  void _handleButtonPress() {
    if (showSignIn) {
      if (_formKey.currentState?.validate() ?? false) {
        // Validation passed - handle Sign Up success
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Sign Up Successful!')));
      }
    } else {
      // Logic for "Continue with OasisNow"
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.p11),
            child: Column(
              children: [
                const AuthAppBar(),
                const SizedBox(height: AppSpacing.p27),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0.0, 0.1),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                  child: showSignIn
                      ? SignInScreen(
                          formKey: _formKey,
                          emailController: _emailController,
                          passwordController: _passwordController,
                          confirmPasswordController: _confirmPasswordController,
                        )
                      : WelcomeScreen(onContinue: _switchToSignIn),
                ),
                const SizedBox(height: AppSpacing.p20),
                CustomElevatedButton(
                  textTheme: AppTypography.textTheme(
                    Theme.of(context).colorScheme,
                  ),
                  text: showSignIn ? 'Sign Up' : 'Continue with OasisNow',
                  color: showSignIn
                      ? AppColors.titleColor1
                      : const Color(0xFF333333),
                  color2: showSignIn
                      ? AppColors.titleColor2
                      : Colors.transparent,
                  textColor: showSignIn ? Colors.black : AppColors.textPrimary,
                  onPressed: _handleButtonPress,
                ),
                const SizedBox(height: AppSpacing.p6),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: showSignIn
                      ? const SignInFooter()
                      : WelcomeFooter(onContinue: _switchToSignIn),
                ),
                const SizedBox(height: AppSpacing.p16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
