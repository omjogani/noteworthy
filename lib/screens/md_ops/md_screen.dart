import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/constants/font_styles.dart';
import 'package:noteworthy/screens/md_ops/components/operations_list.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDownEditor extends StatefulWidget {
  const MarkDownEditor({
    super.key,
    required this.isDarkMode,
    required this.filePath,
  });
  final bool isDarkMode;
  final String filePath;

  @override
  State<MarkDownEditor> createState() => _MarkDownEditorState();
}

class _MarkDownEditorState extends State<MarkDownEditor> {
  final TextEditingController _markdownController = TextEditingController();
  String fileContent = "";

  void loadContentOfFile(String path) async {
    File file = File(path);
    final contents = await file.readAsString();
    _markdownController.text = contents;
    setState(() {
      fileContent = contents;
    });
  }

  @override
  void initState() {
    super.initState();
    loadContentOfFile(widget.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
      child: Column(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.filePath.split('\\').last,
                style: secondaryTitleTextStyle.copyWith(
                    fontWeight: FontWeight.normal),
              ),
              Divider(
                color: widget.isDarkMode ? darkBorderColor : lightBorderColor,
              ),
              MDOperationList(
                isDarkMode: widget.isDarkMode,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? darkLightHoverColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CustomTextFormField(
                      controller: _markdownController,
                      hintText: "Start writing notes from here",
                      keyboardType: TextInputType.multiline,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      validator: (str) {
                        return null;
                      },
                      onChanged: (String changedData) {
                        setState(() {
                          fileContent = changedData;
                        });
                      },
                      onSaved: (String? savedData) {},
                      isDarkMode: widget.isDarkMode,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.isDarkMode
                          ? darkLightHoverColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Markdown(
                      data: fileContent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSaved,
    required this.controller,
    required this.onChanged,
    required this.keyboardType,
    required this.validator,
    required this.onEditingComplete,
    required this.isDarkMode,
  });
  final String hintText;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final Function onEditingComplete;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      expands: true,
      maxLines: null,
      onChanged: onChanged,
      onEditingComplete: () => onEditingComplete(),
      onSaved: onSaved,
      validator: validator,
      keyboardType: keyboardType,
      cursorRadius: const Radius.circular(10.0),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
        ),
        errorStyle: TextStyle(
          color: isDarkMode ? Colors.white54 : Colors.black45,
        ),
        fillColor: Colors.black,
        border: InputBorder.none,
      ),
    );
  }
}
