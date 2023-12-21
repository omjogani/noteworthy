import 'dart:io';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:noteworthy/constants/colors_styles.dart';
import 'package:noteworthy/constants/font_styles.dart';
import 'package:noteworthy/screens/md_ops/md_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.isDarkMode,
  });
  final bool isDarkMode;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<FileSystemEntity> files = [];
  String currentDatabaseDirectory = "N/A";
  String currentOpenedPath = "";

  Future<List<FileSystemEntity>> listFiles(Directory directory) async {
    return await directory.list().toList();
  }

  void _handleDirectoryChange(String? selectedDirectory) async {
    if (selectedDirectory != null) {
      final currentDirectory = Directory(selectedDirectory);
      final demo = await listFiles(currentDirectory);
      setState(() {
        files = demo;
        currentDatabaseDirectory = selectedDirectory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MultiSplitView(
        initialAreas: [
          Area(
            minimalSize: size.width * 0.2,
            size: size.width * 0.25,
          ),
        ],
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.isDarkMode ? darkPrimaryColor : lightPrimaryColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: widget.isDarkMode ? darkBorderColor : lightBorderColor,
                  width: 1),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: widget.isDarkMode ? darkShadowColor : lightShadowColor,
                  offset: const Offset(3, 6),
                  blurRadius: 13,
                  spreadRadius: -10,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Flexible(
                        child: Text(
                          "Your Database",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: secondaryTitleTextStyle,
                        ),
                      ),
                      Row(
                        children: [
                          Tooltip(
                            message: currentDatabaseDirectory,
                            triggerMode: TooltipTriggerMode.tap,
                            child: const Icon(
                              CarbonIcons.view,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          IconButton(
                            tooltip: "Browse Folder",
                            onPressed: () {
                              FilePicker.platform
                                  .getDirectoryPath()
                                  .then((selectedDirectory) {
                                return _handleDirectoryChange(
                                    selectedDirectory);
                              });
                            },
                            icon: const Icon(CarbonIcons.folder),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (context, index) {
                        FileSystemEntity entity = files[index];
                        if (entity is Directory) {
                          return FolderWidget(directory: entity);
                        } else if (entity is File) {
                          return FileWidget(
                            file: entity,
                            onDoubleClick: () {
                              setState(() {
                                currentOpenedPath = entity.path;
                              });
                            },
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: widget.isDarkMode ? darkPrimaryColor : lightPrimaryColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: widget.isDarkMode ? darkBorderColor : lightBorderColor,
                  width: 1),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: widget.isDarkMode ? darkShadowColor : lightShadowColor,
                  offset: const Offset(3, 6),
                  blurRadius: 13,
                  spreadRadius: -10,
                ),
              ],
            ),
            child: Center(
              child: currentOpenedPath != ""
                  ? MarkDownEditor(
                      isDarkMode: widget.isDarkMode,
                      filePath: currentOpenedPath,
                    )
                  : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CarbonIcons.document_unknown,
                            size: 30.0,
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            "File not selected!!",
                            style: secondaryTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class FolderWidget extends StatefulWidget {
  const FolderWidget({super.key, required this.directory});
  final Directory directory;

  @override
  State<FolderWidget> createState() => _FolderWidgetState();
}

class _FolderWidgetState extends State<FolderWidget> {
  List<FileSystemEntity> files = [];
  bool isExpanded = false;

  Future<List<FileSystemEntity>> listFiles(Directory directory) async {
    return await directory.list().toList();
  }

  void _handleDirectoryChange(String? selectedDirectory) async {
    if (selectedDirectory != null) {
      final currentDirectory = Directory(selectedDirectory);
      final demo = await listFiles(currentDirectory);
      setState(() {
        files = demo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.directory.path.split('\\').last, // extract name from path.
      ),
      maintainState: true,
      initiallyExpanded: false,
      shape: const Border(),
      backgroundColor: Colors.pinkAccent,
      leading: const Icon(CarbonIcons.folder),
      childrenPadding: const EdgeInsets.only(
        left: 20.0,
        bottom: 5.0,
      ),
      onExpansionChanged: (expanded) {
        if (expanded) {
          _handleDirectoryChange(widget.directory.path);
        }
      },
      
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: files.length,
          itemBuilder: (context, index) {
            FileSystemEntity entity = files[index];
            if (entity is Directory) {
              return FolderWidget(
                directory: entity,
              );
            } else if (entity is File) {
              return FileWidget(
                file: entity,
                onDoubleClick: () {},
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class FileWidget extends StatelessWidget {
  const FileWidget({
    super.key,
    required this.file,
    required this.onDoubleClick,
  });
  final File file;
  final Function onDoubleClick;

  @override
  Widget build(BuildContext context) {
    String filename = file.path.split('\\').last;

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 8.0),
      child: GestureDetector(
        onDoubleTap: () => onDoubleClick(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(CarbonIcons.document),
            Text(filename),
          ],
        ),
      ),
    );
  }
}
