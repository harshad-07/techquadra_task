import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final BoxBorder? border;
  final bool isNetworkImage, applyImageRadius;
  final Color? overlayColor, backgroundColor;
  final double? width, height, borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  const RoundedImage(
      {super.key,
      this.fit = BoxFit.contain,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor = AppColors.light,
      this.width,
      this.height,
      this.padding,
      this.border,
      this.applyImageRadius = true,
      this.onPressed,
      this.borderRadius = Sizes.md});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius!)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.zero,
          child: Image(
              fit: fit,
              color: overlayColor,
              image: isNetworkImage
                  ? NetworkImage(image)
                  : AssetImage(image) as ImageProvider),
        ),
      ),
    );
  }
}
