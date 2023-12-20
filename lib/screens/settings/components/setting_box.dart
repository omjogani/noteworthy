import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? darkPrimaryColor : Colors.white,
        border: Border.all(color: isDarkMode ? darkBorderColor : lightBorderColor, width: 1),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: isDarkMode ? darkShadowColor : lightShadowColor,
            offset: const Offset(3, 6),
            blurRadius: 13,
            spreadRadius: -10,
          ),
        ],
      ),
      child: child,
    );
  }
}
