import 'package:flutter/material.dart';


class MyPanel extends StatelessWidget {
  const MyPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg.webp'),
              fit: BoxFit.cover
            )
          ),
        ),
      ),
    );
  }
}
void main() {
  runApp(MaterialApp(
    home: const Scaffold(
      body: MyPanel(),
    ),
    theme: ThemeData(
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold
        )
      )
    ),
  ));
}



