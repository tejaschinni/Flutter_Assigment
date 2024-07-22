import 'package:flutter/material.dart';
import 'package:testapp/features/auth_screen/widgets/signin_widget.dart';
import 'package:testapp/features/auth_screen/widgets/signup_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
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
                const SignInWidget()
                // const SignUpWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
