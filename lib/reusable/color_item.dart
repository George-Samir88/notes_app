import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: isSelected
          ? CircleAvatar(
              radius: 34.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: color,
                radius: 28.0,
              ),
            )
          : CircleAvatar(
              backgroundColor: color,
              radius: 28.0,
            ),
    );
  }
}
