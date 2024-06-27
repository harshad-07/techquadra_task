import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../containers/rounded_container.dart';

class CoinsText extends StatelessWidget {
  final int coins;
  final bool alignEnd;
  const CoinsText({super.key, required this.coins, this.alignEnd = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          alignEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Text(coins.toString(),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        const RoundedContainer(
          margin: EdgeInsets.only(left: Sizes.sm),
          backgroundColor: AppColors.secondary,
          radius: 360,
          height: Sizes.sm * 1.6,
          width: Sizes.sm * 1.6,
        )
      ],
    );
  }
}
