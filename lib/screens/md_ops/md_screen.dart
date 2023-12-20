import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/constants/font_styles.dart';
import 'package:noteworthy/screens/md_ops/components/operations_list.dart';

class MarkDownEditor extends StatelessWidget {
  const MarkDownEditor({
    super.key,
    required this.isDarkMode,
  });
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "mynotes.md",
                style: secondaryTitleTextStyle.copyWith(
                    fontWeight: FontWeight.normal),
              ),
              Divider(
                color: isDarkMode ? darkBorderColor : lightBorderColor,
              ),
              MDOperationList(
                isDarkMode: isDarkMode,
              ),
            ],
          ),
        ),
        Center(
          child: Text("MD"),
        ),
      ],
    );
  }
}
