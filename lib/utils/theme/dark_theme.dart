import 'package:flutter/material.dart';

//dark theme
ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: const Color.fromARGB(255, 57, 57, 57),
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade300,
    )
);