import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/features/auth_screen/provider/auth_provider.dart';
import 'package:testapp/features/auth_screen/widgets/custom_button.dart';
import 'package:testapp/features/auth_screen/widgets/custom_textfield.dart';
import 'package:testapp/model/user_model.dart';
import 'package:testapp/utils/contant.dart';
import 'package:testapp/utils/states.dart';

final fromKey = GlobalKey<FormState>();

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var random = Random();
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
              height: mediaQuery.height * 0.7,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18),
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: auth.nameController,
                          title: 'Name',
                          isVisible: false,
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter name';
                            }
                            return null;
                          },
                          suffixwidget: null,
                        ),
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
                          isVisible: !auth.isVisible,
                          suffixwidget: IconButton(
                            icon: Icon(
                              !auth.isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              auth.visiblePassowrd();
                            },
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter passowrd';
                            }
                            return null;
                          },
                        ),
                        CustomTextfield(
                          controller: auth.confirmController,
                          title: 'Confirm password',
                          isVisible: !auth.isconFirm,
                          suffixwidget: IconButton(
                            icon: Icon(
                              !auth.isconFirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              auth.visibleConfirmPassowrd();
                            },
                          ),
                          validator: (v) {
                            if (v!.isEmpty) {
                              return 'Please enter confirm password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    ontap: () {
                      if (fromKey.currentState!.validate()) {
                        if (auth.passwordController.text.toString() ==
                            auth.confirmController.text.toString()) {
                          auth.signUp(UserModel(
                              password: auth.passwordController.text.toString(),
                              email: auth.emailController.text.toString(),
                              name: auth.nameController.text.toString(),
                              id: random.nextInt(100).toString()));
                          if (auth.signUpStatus != SignUpStatus.scussess &&
                              auth.signUpStatus != SignUpStatus.loading) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("something went wrong"),
                              backgroundColor: Colors.red,
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Password done not match"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Enter All Fields"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    },
                    title: "Signup",
                    isloading: false,
                  ),
                ],
              )),
        ],
      );
    });
  }
}
