import 'package:flutter/material.dart';
import 'package:testapp/features/auth_screen/widgets/signup_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 200,
                  scale: 1.3,
                ),
                SizedBox(
                  height: mediaQuery.height * 0.03,
                ),
                const SignUpWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
