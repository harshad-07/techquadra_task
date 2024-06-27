import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../provider/get_users_provider.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import 'detail_screen.dart';
import 'widgets/user_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        iconTheme: const IconThemeData(color: AppColors.white),
        leading: const Icon(Iconsax.document),
        title: const Text(
          'Lists',
          style: TextStyle(
              color: AppColors.white,
              fontSize: Sizes.fontSizeMd * 1.25,
              fontWeight: FontWeight.w500),
          // style: Theme.of(context)
          //     .textTheme
          //     .headlineMedium!
          //     .apply(color: AppColors.white, fontSizeFactor: 0.8),
        ),
        actions: const [
          CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRr3qBVX4XIA8zq3LpBn64zAuOt9_IZ7_H5uA&s')),
          SizedBox(width: Sizes.defaultSpace)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: Consumer<GetUsersProvider>(builder: (context, users, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: users.getAllUsers?.length,
            itemBuilder: (context, index) {
              final userData = users.getAllUsers![index];
              return UserCards(userData: userData,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        UserDetailScreen(userData: userData))),
              );
            },
          );
        }),
      ),
    );
  }
}
