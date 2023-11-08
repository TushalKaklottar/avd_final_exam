import 'package:flutter/material.dart';

Widget iconWidget({required var icon, required Color color}) {
  return Container(
    height: 40,
    width:  50,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: icon,
  );
}