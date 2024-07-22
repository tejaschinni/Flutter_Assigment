import 'package:flutter/material.dart';

class SocialLink extends StatelessWidget {
  String imagePath;
  String title;
  void Function()? onTap;

  SocialLink(
      {super.key,
      required this.imagePath,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 40,
            scale: 12,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ],
      )),
    );
  }
}
