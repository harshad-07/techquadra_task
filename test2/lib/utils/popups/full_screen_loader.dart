import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class FullScreenLoader {
  static void openLoadingDialog(BuildContext context, String text, String animation) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          decoration: BoxDecoration(
              color: HelperFunctions.isDarkMode(context)
                  ? AppColors.dark
                  : AppColors.light),
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              SizedBox(height: 250),
              // AnimationLoader(text: text, animation: animation)
            ],
          ),
        ),
      ),
    );
  }

  static stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
