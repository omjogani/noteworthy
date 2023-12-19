import 'package:flutter/material.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:noteworthy/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  runApp(const MyApp());
  windowManager.ensureInitialized();
  
  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, snapshot) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Diary',
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: ThemeData(
            fontFamily: "SF Pro Text",
          ),
          home: Wrapper(),
        );
      },
    );
  }
}
