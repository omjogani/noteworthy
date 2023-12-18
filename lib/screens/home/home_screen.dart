import 'package:flutter/material.dart';
import 'package:noteworthy/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: (){
            final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
                  provider.toggleTheme(true);
          },
          color: Colors.deepPurple,
          textColor: Colors.white,
          child: Text("Dark/White Mode Switch"),
        )
      ),
    );
  }
}
