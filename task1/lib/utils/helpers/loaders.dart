// import 'package:flutter/material.dart';

// import 'package:iconsax/iconsax.dart';

// import '../constants/colors.dart';

// class Loaders extends StatelessWidget {
//   const Loaders({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
//       content: build(context),
//     );
//   }

//   static successSnackBar({required title, message = ' ', duration = 3}) {
//     Get.snackbar(title, message,
//         isDismissible: true,
//         shouldIconPulse: true,
//         colorText: AppColors.white,
//         backgroundColor: AppColors.success,
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: duration),
//         margin: EdgeInsets.all(12),
//         icon: Icon(
//           Iconsax.check,
//           color: AppColors.white,
//         ));
//   }

//   static warningSnackBar({required title, message = ' ', duration = 3}) {
//     Get.snackbar(title, message,
//         isDismissible: true,
//         shouldIconPulse: true,
//         colorText: AppColors.white,
//         backgroundColor: AppColors.warning,
//         snackPosition: SnackPosition.BOTTOM,
//         duration: Duration(seconds: 5),
//         margin: EdgeInsets.all(12),
//         icon: Icon(
//           Iconsax.warning_2,
//           color: AppColors.white,
//         ));
//   }
// }
