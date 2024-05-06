import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minimal_social_app/widgets/my_button.dart';
import 'package:minimal_social_app/widgets/my_textfield.dart';

import '../helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPwController = TextEditingController();

  void _registerUser() async {
    final enteredPassword = _passwordController.text.trim();
    final enteredConfirmPw = _confirmPwController.text.trim();

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (enteredConfirmPw != enteredPassword) {
      displayMessengerToUser('Confirm password does not match...', context);
    }

    // creating new user
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pop(context);
      displayMessengerToUser('Register Successfully', context);
    } on FirebaseAuthException catch (err) {
      Navigator.pop(context);
      displayMessengerToUser(err.code, context);
    }
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
                    controller: _usernameController,
                  ),
                  const SizedBox(height: 12),

                  // email text field
                  MyTextField(
                    hintText: 'Email',
                    obscureText: false,
                    controller: _emailController,
                  ),
                  const SizedBox(height: 12),

                  // password text field
                  MyTextField(
                    hintText: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                  ),
                  const SizedBox(height: 12),

                  // confirm password text field
                  MyTextField(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    controller: _confirmPwController,
                  ),
                  const SizedBox(height: 48),

                  // sign in button
                  MyButton(
                    text: 'Register',
                    onTap: _registerUser,
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
                        onTap: widget.onTap,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
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
