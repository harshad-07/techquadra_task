import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  final IconData icon;
  final String? title, subTitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const SettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.subTitle,
      this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primary, size: 28),
      title: Text(title!, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle!, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
