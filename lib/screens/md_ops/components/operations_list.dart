import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';

class MDOperationList extends StatelessWidget {
  const MDOperationList({
    super.key,
    required this.isDarkMode,
  });
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          color: isDarkMode ? darkLightHoverColor : Colors.white,
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
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            MDOperationIconButton(
              icon: CarbonIcons.copy,
              tooltipMessage: "Copy",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.save,
              tooltipMessage: "Save",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.table_of_contents,
              tooltipMessage: "Table of Content",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              customContent: const Text(
                "H1",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              tooltipMessage: "Heading",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              customContent: const Text(
                "H2",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              tooltipMessage: "Sub-Heading",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              customContent: const Text(
                "H3",
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              tooltipMessage: "Sub-Heading",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.list_numbered,
              tooltipMessage: "Numbers",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.link,
              tooltipMessage: "Link",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.image,
              tooltipMessage: "Image",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            
            MDOperationIconButton(
              icon: CarbonIcons.list,
              tooltipMessage: "List",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.text_italic,
              tooltipMessage: "Italic",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.text_bold,
              tooltipMessage: "Bold",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.quotes,
              tooltipMessage: "Quote",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.script,
              tooltipMessage: "Code",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.script,
              tooltipMessage: "Code",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
            MDOperationIconButton(
              icon: CarbonIcons.script,
              tooltipMessage: "Code",
              isDarkMode: isDarkMode,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class MDOperationIconButton extends StatelessWidget {
  const MDOperationIconButton({
    super.key,
    required this.onPressed,
    required this.tooltipMessage,
    required this.isDarkMode,
    this.icon,
    this.customContent,
  });
  final IconData? icon;
  final Function onPressed;
  final String tooltipMessage;
  final bool isDarkMode;
  final Widget? customContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => onPressed(),
        child: Tooltip(
          message: tooltipMessage,
          child: Container(
            height: 28.0,
            width: 28.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: isDarkMode ? darkPrimaryColor : lightPrimaryColor,
              border: Border.all(
                color: isDarkMode ? Colors.transparent : Colors.black45,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: customContent ??
                Icon(
                  icon,
                  size: 18,
                ),
          ),
        ),
      ),
    );
  }
}
