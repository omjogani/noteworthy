import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final FocusNode _markdownFocusNode = FocusNode();
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

  void insertDataCurrentPosition(String data, {bool isNewLineAfter = false}) {
    final currentText = _markdownController.text;
    final currentSelection = _markdownController.selection;

    final buffer = StringBuffer();
    buffer.write(currentText.substring(0, currentSelection.start));
    if (!currentText.endsWith('\n') && currentText.isNotEmpty) {
      buffer.writeln();
    }
    buffer.write(data);
    if (isNewLineAfter) {
      buffer.writeln();
    }
    buffer.write(currentText.substring(currentSelection.end));

    final newText = buffer.toString();
    final newSelection = TextSelection.fromPosition(
      TextPosition(offset: newText.length),
    );

    _markdownController.value = TextEditingValue(
      text: newText,
      selection: newSelection,
      composing: TextRange.empty,
    );
    _markdownFocusNode.requestFocus();
  }

  //TODO: Implement Auto Save on every 3 Minute
  void onSavePressed() async {
    final file = File(widget.filePath);

    try {
      await file.writeAsString(_markdownController.text);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Saved!!')),
      );
    } catch (e) {
      print('Error writing to file: $e');
    }
  }
  bool _isMenuOpen = false;

  void _openMenu() {
    setState(() {
      _isMenuOpen = true;
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuOpen = false;
    });
  }

  void _handleMenuItemSelected(String value) {
    _markdownController.text += value;
    _closeMenu();
  }

  void onCopyPressed() {
    Clipboard.setData(ClipboardData(text: _markdownController.text)).then((_) {
      // TODO: Custom SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Copied to clipboard!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error while coping!!')),
      );
    });
  }

  void onTableContentPressed() {}
  void onHeading1Pressed() => insertDataCurrentPosition("# ");
  void onHeading2Pressed() => insertDataCurrentPosition("## ");
  void onHeading3Pressed() => insertDataCurrentPosition("### ");
  void onDividerPressed() =>
      insertDataCurrentPosition("---", isNewLineAfter: true);
  void onListPressed() => insertDataCurrentPosition("- ");
  void onLinkPressed() {}
  void onNumbersPressed() {}
  void onImagePressed() {}
  void onItalicPressed() {}
  void onBoldPressed() {}
  void onQuotePressed() {}
  void onCodePressed() {}

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
                onSavePressed: onSavePressed,
                onCopyPressed: onCopyPressed,
                onTableContentPressed: onTableContentPressed,
                onHeading1Pressed: onHeading1Pressed,
                onHeading2Pressed: onHeading2Pressed,
                onHeading3Pressed: onHeading3Pressed,
                onNumbersPressed: onNumbersPressed,
                onLinkPressed: onLinkPressed,
                onImagePressed: onImagePressed,
                onListPressed: onListPressed,
                onItalicPressed: onItalicPressed,
                onBoldPressed: onBoldPressed,
                onQuotePressed: onQuotePressed,
                onCodePressed: onCodePressed,
                onDividerPressed: onDividerPressed,
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
                      onEditingComplete: () {},
                      validator: (str) {
                        return null;
                      },
                      onChanged: (String changedData) {
                        if (changedData.endsWith('/')) {
                          _openMenu();
                        } else {
                          _closeMenu();
                        }
                        setState(() {
                          fileContent = changedData;
                        });
                      },
                      onSaved: (String? savedData) {},
                      focusNode: _markdownFocusNode,
                      isDarkMode: widget.isDarkMode,
                      isMenuOpen: _isMenuOpen,
                      handleMenuItemSelected: (String? val) => _handleMenuItemSelected(val!),
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
    required this.focusNode,
    required this.isDarkMode,
    required this.isMenuOpen,
    required this.handleMenuItemSelected,
  });
  final String hintText;
  final FormFieldSetter<String>? onSaved;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final Function onEditingComplete;
  final FocusNode focusNode;
  final bool isDarkMode;
  final bool isMenuOpen;
  final Function(String?) handleMenuItemSelected;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      expands: true,
      maxLines: null,
      focusNode: focusNode,
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
      suffixIcon: isMenuOpen
            ? PopupMenuButton<String>(
                onSelected: handleMenuItemSelected,
                itemBuilder: (context) => [
                  PopupMenuItem(value: 'bold', child: Text('Bold')),
                  PopupMenuItem(value: 'italic', child: Text('Italic')),
                  PopupMenuItem(value: 'link', child: Text('Link')),
                ],
              )
            : null,
      ),
    );
  }
}
