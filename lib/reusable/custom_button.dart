import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTab});

  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 55.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Text(
            'Add',
            style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
