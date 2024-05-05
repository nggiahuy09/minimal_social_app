import 'package:flutter/material.dart';
import 'package:minimal_social_app/auth/login_or_register.dart';
import 'package:minimal_social_app/theme/dark_mode.dart';
import 'package:minimal_social_app/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const AuthPage(),
    );
  }
}