import 'package:agrotech/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AgroTech());
}

class AgroTech extends StatelessWidget {
  const AgroTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroTech',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.green)),
      home: const WelcomeScreen(),
    );
  }
}
