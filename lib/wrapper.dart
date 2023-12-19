import 'package:flutter/material.dart';
import 'package:noteworthy/screens/settings/setting_screen.dart';
import 'package:noteworthy/widgets/navbar.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          NavBar(),
          Expanded(
            child: SettingsScreen(),
          ),
        ],
      ),
    );
  }
}
