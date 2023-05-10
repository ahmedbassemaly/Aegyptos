import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context, IconData icon, Color iconColor, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(message),
        ],
      ),
      duration: const Duration(milliseconds: 3000),
      width: MediaQuery.of(context).size.width * 0.65,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
        vertical: MediaQuery.of(context).size.width * 0.02,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}
