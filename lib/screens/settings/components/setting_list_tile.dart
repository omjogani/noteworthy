import 'package:flutter/material.dart';

class SettingListTile extends StatelessWidget {
  const SettingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.person),
          Text("Dark Mode"),
        ],
      ),
    );
  }
}