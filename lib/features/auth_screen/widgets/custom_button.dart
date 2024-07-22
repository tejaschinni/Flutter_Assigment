import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  bool? isloading;
  final String? title;
  void Function()? ontap;
  CustomButton(
      {super.key,
      this.isloading = false,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width * 0.89,
        height: MediaQuery.of(context).size.height * 0.075,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: isloading != false
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                title.toString(),
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
      ),
    );
  }
}
