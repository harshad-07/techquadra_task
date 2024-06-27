import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class SearchContainer extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry? margin;

  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.margin = const EdgeInsets.symmetric(horizontal: Sizes.defaultSpace),
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return Container(
      margin: margin,
      width: DeviceUtils.getScreenWidth(context),
      padding: const EdgeInsets.all(Sizes.md),
      decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? AppColors.dark
                  : AppColors.light
              : Colors.transparent,
          border: Border.all(color: AppColors.grey),
          borderRadius:
              showBorder ? BorderRadius.circular(Sizes.cardRadiusLg) : null),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.darkGrey,
          ),
          const SizedBox(
            width: Sizes.spaceBtwItems,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .apply(color: AppColors.darkGrey),
          )
        ],
      ),
    );
  }
}
