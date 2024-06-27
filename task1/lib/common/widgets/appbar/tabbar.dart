import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';
import '../../../utils/helpers/helper_functions.dart';

class CategoryTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const CategoryTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {

    return Material(
      color: AppColors.accent,
      child: TabBar(
        tabs: tabs,
        dividerColor: Colors.transparent,
        isScrollable: false,
        indicatorColor: AppColors.primary,
        unselectedLabelColor: AppColors.darkGrey,
        labelColor: AppColors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
