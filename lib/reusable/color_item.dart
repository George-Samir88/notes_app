import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 36.0,
      ),
    );
  }
}
