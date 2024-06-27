import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class CustomGridLayout extends StatelessWidget {
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext context, int) itembuilder;

  const CustomGridLayout(
      {super.key,
      required this.itemCount,
      this.mainAxisExtent = 269,
      required this.itembuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisExtent,
          crossAxisSpacing: Sizes.gridViewSpacing,
          mainAxisSpacing: Sizes.gridViewSpacing),
      itemBuilder: itembuilder,
    );
  }
}
