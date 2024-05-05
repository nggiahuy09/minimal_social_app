import 'package:flutter/material.dart';
import 'package:minimal_social_app/widgets/my_button.dart';
import 'package:minimal_social_app/widgets/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    // todo: connect to Firebase & implement this function
  }

  void register() {
    // todo: connect to Firebase & implement this function
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 80,
                ),
                const SizedBox(height: 24),

                // app name
                const Text(
                  'MINIMAL SOCIAL',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 48),

                // email text field
                MyTextField(
                  hintText: 'Email',
                  obscureText: false,
                  controller: emailController,
                ),
                const SizedBox(height: 12),

                // password text field
                MyTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 12),

                // forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // sign in button
                MyButton(
                  text: 'Login',
                  onTap: login,
                ),
                const SizedBox(height: 24),

                // don't have account? register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have account? ',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: register,
                      child: Text(
                        'Register Here',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
