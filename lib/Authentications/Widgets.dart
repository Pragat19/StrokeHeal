// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:strokeheal/OpeningPages/Slider_image.dart';
import 'package:strokeheal/Widget.dart';

Widget LoginWithFB(context) {
  final size = MediaQuery.of(context).size;
  final height = size.height;
  final width = size.width;

  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 80, 118, 234),
          fixedSize: Size(width * 0.9, height * 0.07),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: () {
        nextScreen(context, const SliderImageScreen());
      },
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage("assets/image/facebook.png"),
            height: 20,
            width: 20,
          ),
          Text(
            'Log in With Facebook',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          )
        ],
      ));
}
