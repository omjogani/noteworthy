import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingMenuBar extends StatelessWidget {
  const SettingMenuBar({
    super.key,
    required this.settingMenuList,
  });
  final List<SettingMenuBarTile> settingMenuList;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: isDarkMode ? darkPrimaryColor : lightPrimaryColor,
          border: Border.all(
              color: isDarkMode ? darkBorderColor : lightBorderColor, width: 1),
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
        child: Column(
          children: settingMenuList,
        ),
      ),
    );
  }
}

class SettingMenuBarTile extends StatefulWidget {
  const SettingMenuBarTile({
    super.key,
    required this.isSelected,
    required this.icon,
    required this.text,
    required this.onPressed,
  });
  final bool isSelected;
  final IconData icon;
  final String text;
  final Function onPressed;

  @override
  State<SettingMenuBarTile> createState() => _SettingMenuBarTileState();
}

class _SettingMenuBarTileState extends State<SettingMenuBarTile> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;
    return InkWell(
      onHover: (bool isHoverNew) {
        setState(() {
          isHover = isHoverNew;
        });
      },
      onTap: () => widget.onPressed(),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? isDarkMode
                  ? darkHoverColor
                  : Colors.white
              : isHover
                  ? isDarkMode
                      ? darkLightHoverColor
                      : lightHoverColor
                  : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? isDarkMode
                        ? darkPrimaryColor
                        : lightHoverColor
                    : isHover
                        ? isDarkMode
                            ? darkHoverColor
                            : lightHoverColor
                        : null,
                border: widget.isSelected
                    ? Border.all(
                        color:
                            isDarkMode ? Colors.grey.shade400 : Colors.black45,
                      )
                    : isHover
                        ? Border.all(
                            color: isDarkMode
                                ? lightHoverColor
                                : Colors.grey.shade400,
                          )
                        : Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Icon(
                widget.icon,
              ),
            ),
            const SizedBox(width: 10.0),
            Flexible(
              child: Text(
                widget.text,
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
