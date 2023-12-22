import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';

class MDOperationList extends StatelessWidget {
  const MDOperationList({
    super.key,
    required this.isDarkMode,
    required this.onSavePressed,
    required this.onCopyPressed,
    required this.onTableContentPressed,
    required this.onHeading1Pressed,
    required this.onHeading2Pressed,
    required this.onHeading3Pressed,
    required this.onNumbersPressed,
    required this.onLinkPressed,
    required this.onImagePressed,
    required this.onListPressed,
    required this.onItalicPressed,
    required this.onBoldPressed,
    required this.onQuotePressed,
    required this.onCodePressed,
    required this.onDividerPressed,
  });
  final bool isDarkMode;
  final Function onSavePressed;
  final Function onCopyPressed;
  final Function onTableContentPressed;
  final Function onHeading1Pressed;
  final Function onHeading2Pressed;
  final Function onHeading3Pressed;
  final Function onNumbersPressed;
  final Function onLinkPressed;
  final Function onImagePressed;
  final Function onListPressed;
  final Function onItalicPressed;
  final Function onBoldPressed;
  final Function onQuotePressed;
  final Function onCodePressed;
  final Function onDividerPressed;

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
              onPressed: onCopyPressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.save,
              tooltipMessage: "Save",
              isDarkMode: isDarkMode,
              onPressed: onSavePressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.table_of_contents,
              tooltipMessage: "Table of Content",
              isDarkMode: isDarkMode,
              onPressed: onTableContentPressed,
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
              onPressed: onHeading1Pressed,
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
              onPressed: onHeading2Pressed,
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
              onPressed: onHeading3Pressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.list_numbered,
              tooltipMessage: "Numbers",
              isDarkMode: isDarkMode,
              onPressed: onNumbersPressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.link,
              tooltipMessage: "Link",
              isDarkMode: isDarkMode,
              onPressed: onLinkPressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.image,
              tooltipMessage: "Image",
              isDarkMode: isDarkMode,
              onPressed: onImagePressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.list,
              tooltipMessage: "List",
              isDarkMode: isDarkMode,
              onPressed: onListPressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.text_italic,
              tooltipMessage: "Italic",
              isDarkMode: isDarkMode,
              onPressed: onItalicPressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.text_bold,
              tooltipMessage: "Bold",
              isDarkMode: isDarkMode,
              onPressed: onBoldPressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.quotes,
              tooltipMessage: "Quote",
              isDarkMode: isDarkMode,
              onPressed: onQuotePressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.script,
              tooltipMessage: "Code",
              isDarkMode: isDarkMode,
              onPressed: onCodePressed,
            ),
            MDOperationIconButton(
              icon: CarbonIcons.subtract,
              tooltipMessage: "Code",
              isDarkMode: isDarkMode,
              onPressed: onDividerPressed,
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
