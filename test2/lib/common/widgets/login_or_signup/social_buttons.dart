import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey)),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                Images.google,
                height: Sizes.iconMd,
                width: Sizes.iconMd,
              )),
        ),
        const SizedBox(
          width: Sizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.grey)),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                Images.facebook,
                height: Sizes.iconMd,
                width: Sizes.iconMd,
              )),
        ),
      ],
    );
  }
}
