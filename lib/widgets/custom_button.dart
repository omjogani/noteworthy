import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.backgroundColor,
    required this.onPressed,
    required this.isDarkMode,
    this.icon,
  });
  final String buttonText;
  final Color backgroundColor;
  final IconData? icon;
  final Function onPressed;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: isDarkMode ? darkShadowColor : lightShadowColor,
              offset: const Offset(3, 6),
              blurRadius: 13,
              spreadRadius: -10,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            icon != null ? Icon(icon) : const SizedBox.shrink(),
            icon != null ? const SizedBox(width: 5.0) : const SizedBox.shrink(),
            Flexible(
              child: Text(
                buttonText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
