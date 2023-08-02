import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: isSelected
          ? const CircleAvatar(
              radius: 34.0,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 28.0,
              ),
            )
          : const CircleAvatar(
              backgroundColor: Colors.red,
              radius: 28.0,
            ),
    );
  }
}
