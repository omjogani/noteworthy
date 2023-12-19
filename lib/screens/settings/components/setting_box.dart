import 'package:flutter/material.dart';

class SettingBox extends StatelessWidget {
  const SettingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black54, width: 1),
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFFa5a5a5).withOpacity(1),
            offset: const Offset(3, 6),
            blurRadius: 13,
            spreadRadius: -10,
          ),
        ],
      ),
    );
  }
}
