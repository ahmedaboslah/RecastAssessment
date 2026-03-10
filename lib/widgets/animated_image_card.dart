import 'package:flutter/material.dart';
import 'package:recasttask/themes/app_spacing.dart';
import 'package:recasttask/themes/app_radius.dart';

class AnimatedImageCard extends StatelessWidget {
  final String image;

  const AnimatedImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.p7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r7),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
