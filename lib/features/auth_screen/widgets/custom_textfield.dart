import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String title;
  TextEditingController controller;
  bool? isVisible;
  Widget? suffixwidget;
  String? Function(String?)? validator;
  CustomTextfield(
      {super.key,
      required this.title,
      required this.controller,
      this.isVisible,
      this.suffixwidget,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      height: mediaquery.height * 0.12,
      width: mediaquery.width,
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        obscureText: isVisible!,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(15)),
            fillColor: Colors.white,
            hintText: title,
            hintStyle: const TextStyle(color: Colors.white),
            suffixIcon: suffixwidget),
        controller: controller,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
