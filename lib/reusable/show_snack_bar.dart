import 'package:flutter/material.dart';

showSnackBar({
  required context,
  required String content,
  Color actionColor = Colors.green,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
        backgroundColor: actionColor,
        shape: const RoundedRectangleBorder(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        duration: const Duration(
          seconds: 2,
        ),
        dismissDirection: DismissDirection.startToEnd,
      ),
    );
