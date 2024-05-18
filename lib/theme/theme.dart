import 'package:flutter/material.dart';

TextStyle style1 = const TextStyle(
  fontFamily: 'Poppins',
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

InputDecoration decoration1 = InputDecoration(
  filled: true,
  fillColor: const Color(0xFFF6F7FA),
  enabled: false,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  // focusedBorder: OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(10),
  //   borderSide: const BorderSide(color: Colors.black),
  // ),
  labelStyle: const TextStyle(
    color: Colors.black45,
  ),
);
