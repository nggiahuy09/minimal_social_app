import 'package:flutter/material.dart';
import 'package:minimal_social_app/widgets/my_button.dart';
import 'package:minimal_social_app/widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPwController = TextEditingController();
  final void Function()? onTap;

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
            child: SingleChildScrollView(
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
                    'CREATE YOUR ACCOUNT',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 48),
              
                  // user name
                  MyTextField(
                    hintText: 'Username',
                    obscureText: false,
                    controller: usernameController,
                  ),
                  const SizedBox(height: 12),
              
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
              
                  // confirm password text field
                  MyTextField(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    controller: confirmPwController,
                  ),
                  const SizedBox(height: 48),
              
                  // sign in button
                  MyButton(
                    text: 'Register',
                    onTap: register,
                  ),
                  const SizedBox(height: 24),
              
                  // don't have account? register here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Have Account? ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.inversePrimary),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
