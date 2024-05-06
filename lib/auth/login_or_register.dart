import 'package:flutter/material.dart';
import 'package:minimal_social_app/pages/login_page.dart';
import 'package:minimal_social_app/pages/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPage();
}

class _LoginOrRegisterPage extends State<LoginOrRegisterPage> {
  // initially, show login page
  bool showLogin = true;

  // toggle between login and register page
  void togglePages() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showLogin) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}
