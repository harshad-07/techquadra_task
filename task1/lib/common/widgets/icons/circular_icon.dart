import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularIcon extends StatelessWidget {
  final double? width, height, size;
  final IconData icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  const CircularIcon(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.size = Sizes.lg,
      required this.icon,
      this.color,
      this.backgroundColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: backgroundColor != null
              ? backgroundColor
              : HelperFunctions.isDarkMode(context)
                  ? AppColors.black.withOpacity(0.9)
                  : AppColors.light.withOpacity(0.9),
          shape: BoxShape.circle),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: color,
            size: size,
          )),
    );
  }
}
