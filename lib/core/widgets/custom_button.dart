import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double height, width, elevation;
  final VoidCallback? onPressed;
  final bool isUpperCase;
  final IconData? iconData;

  const CustomButton({
    required this.text,
    this.height = 55,
    this.width = double.infinity,
    required this.onPressed,
    this.isUpperCase = true,
    this.elevation = 0,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      elevation: elevation,
      minWidth: width,
      height: height,
      child: SizedBox(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (iconData != null)
              Icon(
                iconData,
              ),
            Text(text),
            if (iconData != null) const SizedBox()
          ],
        ),
      ),
    );
  }
}
