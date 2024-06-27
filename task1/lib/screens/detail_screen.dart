import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../common/widgets/containers/rounded_container.dart';
import '../model/get_user_model.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/sizes.dart';
import 'widgets/custom_expansion_tile.dart';
import 'widgets/profile_menu.dart';

class UserDetailScreen extends StatelessWidget {
  final GetUsersModel userData;
  const UserDetailScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        iconTheme: const IconThemeData(color: AppColors.white),
        title: Text('Details',
            style: TextStyle(
                color: AppColors.white,
                fontSize: Sizes.fontSizeMd * 1.25,
                fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.defaultSpace),
        child: ListView(
          children: [
            PersonalInfoWidget(userData: userData),
            const SizedBox(height: Sizes.spaceBtwSections),
            CompanyInfoWidget(userData: userData),
          ],
        ),
      ),
    );
  }
}

class PersonalInfoWidget extends StatelessWidget {
  final GetUsersModel userData;
  const PersonalInfoWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpansionCard(
      title: 'Personal Information',
      childrens: [
        ProfileMenu(
          title: 'Username',
          value: userData.username,
        ),
        ProfileMenu(
          title: 'Name',
          value: userData.name,
        ),
        ProfileMenu(
          title: 'Email',
          value: userData.email,
        ),
        ProfileMenu(
          title: 'Phone No.',
          value: userData.phone.toString(),
        ),
        ProfileMenu(
          title: 'Address',
          value:
              '${userData.address.suite}, ${userData.address.street}, ${userData.address.city}, ${userData.address.zipcode}',
        ),
      ],
    );
  }
}

class CompanyInfoWidget extends StatelessWidget {
  final GetUsersModel userData;
  const CompanyInfoWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return CustomExpansionCard(
      title: 'Company Information',
      childrens: [
        ProfileMenu(
          title: 'Name',
          value: userData.company.name,
        ),
        ProfileMenu(
          title: 'Tagline',
          value: userData.company.catchPhrase,
        ),
        ProfileMenu(
          title: 'BS',
          value: userData.company.bs,
        ),
        ProfileMenu(
          title: 'Website',
          value: userData.website,
        ),
      ],
    );
  }
}
