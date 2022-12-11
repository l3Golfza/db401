import 'package:flutter/material.dart';

import 'pages/category.dart';

void main() {
  runApp(MaterialApp(
    home: const Category(),
    theme: ThemeData(
      textTheme: const TextTheme(
        button: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold
        )
      )
    ),
  ));
}