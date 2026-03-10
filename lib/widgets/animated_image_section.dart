import 'package:flutter/material.dart';
import 'package:recasttask/themes/app_spacing.dart';
import 'package:recasttask/widgets/animated_image_row.dart';
import 'package:recasttask/core/data/app_images_list.dart';

class AnimatedImageSection extends StatelessWidget {
  const AnimatedImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedImageRow(
          items: appImagesList1,
          isLeftToRight: true,
          height: 120,
          speed: 40.0,
        ),
        const SizedBox(height: AppSpacing.p7),
        AnimatedImageRow(
          items: appImagesList2,
          isLeftToRight: false,
          height: 120,
          speed: 40.0,
        ),
      ],
    );
  }
}
