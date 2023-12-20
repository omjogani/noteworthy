import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/constants/font_styles.dart';

class SettingListTile extends StatefulWidget {
  const SettingListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.actionWidget,
    required this.isDarkMode,
  });
  final IconData? icon;
  final String title;
  final String? description;
  final Widget actionWidget;
  final bool isDarkMode;

  @override
  State<SettingListTile> createState() => _SettingListTileState();
}

class _SettingListTileState extends State<SettingListTile> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: size.height * 0.15),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: widget.isDarkMode ? darkHoverColor : Colors.white,
          border: Border.all(
              color: widget.isDarkMode ? darkBorderColor : lightBorderColor,
              width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: widget.isDarkMode ? darkShadowColor : lightShadowColor,
              offset: const Offset(3, 6),
              blurRadius: 13,
              spreadRadius: -10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.icon != null
                    ? Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: widget.isDarkMode
                              ? darkPrimaryColor
                              : lightHoverColor,
                          border: Border.all(
                            color: widget.isDarkMode
                                ? lightHoverColor
                                : Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          widget.icon,
                        ),
                      )
                    : const SizedBox.shrink(),
                widget.icon != null
                    ? const SizedBox(width: 8.0)
                    : const SizedBox.shrink(),
                Text(
                  widget.title,
                  style: secondaryTitleTextStyle,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: widget.icon != null ? 40.0 : 0.0),
              child: Text(
                widget.description ?? "",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: widget.icon != null ? 40.0 : 0.0),
              child: widget.actionWidget,
            ),
          ],
        ),
      ),
    );
  }
}
