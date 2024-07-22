import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testapp/features/auth_screen/provider/auth_provider.dart';
import 'package:testapp/features/auth_screen/widgets/custom_button.dart';
import 'package:testapp/features/auth_screen/widgets/custom_textfield.dart';
import 'package:testapp/features/auth_screen/widgets/social_link.dart';
import 'package:testapp/utils/contant.dart';
import 'package:testapp/utils/states.dart';

final fromKey = GlobalKey<FormState>();

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Consumer<AuthProvider>(builder: (context, auth, _) {
      return Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                color: Color(0xff4E565A),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(43.0),
                  topRight: Radius.circular(43.0),
                ),
              ),
              width: double.infinity,
              height: mediaQuery.height * 0.8,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
              child: Column(
                children: [
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 21.0, color: Colors.white),
                  ),
                  const SizedBox(height: 25.0),
                  Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: auth.emailController,
                          title: 'Email ID',
                          isVisible: false,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter email id';
                            } else if (!isValidEmail(v)) {
                              return 'Please enter vaild email';
                            }
                            return null;
                          },
                          suffixwidget: null,
                        ),
                        CustomTextfield(
                          controller: auth.passwordController,
                          title: 'Password',
                          isVisible: true,
                          suffixwidget: const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter passowrd';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    ontap: () async {
                      if (fromKey.currentState!.validate()) {
                        auth.signInfunction(
                            auth.emailController.text.toString(),
                            auth.passwordController.text.toString());
                        if (auth.sigInStatu != SignStatus.loading) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Invalid Email and passowrd"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Enter Email and passowrd"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    title: "Login",
                    isloading: false,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot Password?",
                            style: TextStyle(
                              color: Colors.red,
                            ))),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                        onPressed: () {
                          context.go('/auth/signup');
                          auth.clearSignUpField();
                        },
                        child: const Text("Don't have account SignUp",
                            style: TextStyle(
                              color: Colors.red,
                            ))),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialLink(
                          imagePath: 'assets/google.png',
                          onTap: () {},
                          title: "Google"),
                      SocialLink(
                          imagePath: 'assets/linkedin.png',
                          onTap: () {},
                          title: "LinkedIn"),
                      SocialLink(
                          imagePath: 'assets/facebook.png',
                          onTap: () {},
                          title: "Facebook")
                    ],
                  )
                ],
              )),
        ],
      );
    });
  }
}
