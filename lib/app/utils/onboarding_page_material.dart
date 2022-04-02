// import 'dart:html';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnBoardingPageMaterial extends StatelessWidget {
  final String imgaePath;

  const OnBoardingPageMaterial({required this.imgaePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: Image.asset(
        imgaePath,
        fit: BoxFit.fill,
      ),
    );
  }
}
