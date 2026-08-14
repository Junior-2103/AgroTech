import 'package:agrotech/screens/welcome_screen.dart';
import 'package:agrotech/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String welcome = "/welcome";
  static const String home = "/home";

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      welcome: (context) => WelcomeScreen(),
      home: (context) => HomeScreen(),
    };
  }
}
