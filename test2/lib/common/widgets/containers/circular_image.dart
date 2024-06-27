import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final double width, height, padding;

  const CircularImage(
      {super.key,
      this.fit,
      required this.image,
      this.isNetworkImage = false,
      this.overlayColor,
      this.backgroundColor,
      this.width = 56,
      this.height = 56,
      this.padding = Sizes.sm});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ??
              (HelperFunctions.isDarkMode(context)
                  ? AppColors.black
                  : AppColors.white),
          shape: BoxShape.circle),
      child: Center(
        child: Image(
            fit: fit,
            color: overlayColor,
            image: isNetworkImage
                ? NetworkImage(image)
                : AssetImage(image) as ImageProvider),
      ),
    );
  }
}
