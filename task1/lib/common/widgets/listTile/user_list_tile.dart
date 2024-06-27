import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../containers/circular_image.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);

    return ListTile(
      leading: const CircularImage(
        image: Images.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text('Name',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: dark ? AppColors.light : AppColors.black)),
      subtitle: Text('email',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: dark ? AppColors.light : AppColors.black)),
      trailing: IconButton(
          onPressed: () {},
          // onPressed: () => Get.to(() => const Profile()),
          icon: const Icon(
            Iconsax.edit,
            color: AppColors.buttonPrimary,
          )),
    );
  }
}
