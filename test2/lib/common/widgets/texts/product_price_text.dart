import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  final String price;
  final int maxLines;
  final bool isLarge, lineThrough;
  // final EdgeInsetsGeometry? padding;

  const ProductPriceText({
    super.key,
    // this.currencySign = '₹',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
    // this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '₹$price',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineSmall!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.labelLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
