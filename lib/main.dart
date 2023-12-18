import 'package:flutter/material.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:noteworthy/screens/settings/setting_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
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
          home: SettingsScreen(),
        );
      },
    );
  }
}
