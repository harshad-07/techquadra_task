import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class FormDivider extends StatelessWidget {
  final bool? dark;
  final String dividerText;

  const FormDivider({
    super.key,
    this.dark,
    required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    final darkMode = HelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: darkMode ? AppColors.darkGrey : AppColors.grey,
            indent: 60,
            endIndent: 5,
            thickness: 0.7,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: darkMode ? AppColors.darkGrey : AppColors.grey,
            indent: 5,
            endIndent: 60,
            thickness: 0.7,
          ),
        ),
      ],
    );
  }
}
