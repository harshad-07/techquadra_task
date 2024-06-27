import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  final String text;
  final Widget tailing;
  final bool showActionButton;
  final Color? textColor;
  final void Function()? onPressed;

  const SectionHeading({
    super.key,
    required this.text,
    this.tailing = const Text('View All'),
    this.showActionButton = true,
    this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        if (showActionButton) TextButton(onPressed: onPressed, child: tailing),
      ],
    );
  }
}
