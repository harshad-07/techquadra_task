import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomExpansionCard extends StatelessWidget {
  final String title;
  final List<Widget> childrens;
  const CustomExpansionCard({
    super.key,
    required this.title,
    required this.childrens,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: AppColors.primary50,
      collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.cardRadiusLg)),
      backgroundColor: AppColors.primary50,
      collapsedIconColor: AppColors.white,
      iconColor: AppColors.white,
      initiallyExpanded: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.cardRadiusLg)),
      childrenPadding: EdgeInsets.symmetric(horizontal: Sizes.md * 2),
      expandedAlignment: Alignment.centerLeft,
      // expandedCrossAxisAlignment: CrossAxisAlignment.start,
      maintainState: true,
      title: Text(title,
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: AppColors.white)),
      children: childrens,
    );
  }
}
