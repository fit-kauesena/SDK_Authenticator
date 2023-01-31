import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF323751);

Widget button(String label, void Function()? onTap) {
  return Container(
    margin: const EdgeInsets.all(10),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        elevation: 0,
        padding: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
