import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProfileMenu extends StatelessWidget {
  final Icon icon;
  final String title, value;
  final VoidCallback? onPressed;

  const ProfileMenu({
    super.key,
    this.icon = const Icon(Iconsax.arrow_right_34),
    required this.title,
    required this.value,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: AppColors.white),
                  overflow: TextOverflow.ellipsis,
                )),
            const SizedBox(
              width: Sizes.sm,
              child: Text(
                ':',
                style: TextStyle(color: AppColors.light),
              ),
            ),
            Expanded(
                flex: 2,
                child: Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .apply(color: AppColors.white),
                  // overflow: TextOverflow.ellipsis,
                )),
            // icon,
          ],
        ),
      ),
    );
  }
}
