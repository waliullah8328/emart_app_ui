import 'package:flutter/material.dart';

Widget ourButton({required String title, required Color color, required Color textColor, required VoidCallback onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    onPressed: onPress,
    child: Text(
      title,   // Ensure title is used within a Text widget, not directly as a .text modifier.
      style: TextStyle(color: textColor),
    ),
  );
}
