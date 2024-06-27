import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: Sizes.appBarHeight,
    bottom: Sizes.defaultSpace,
    left: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
  );
}
