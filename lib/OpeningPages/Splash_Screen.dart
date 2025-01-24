// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:strokeheal/OpeningPages/Slider_image.dart';
import 'package:strokeheal/Widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => nextScreen(context, const SliderImageScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.teal],
          ),
        ),
        child: const Center(
          child: Image(
            image: AssetImage('assets/image/Logo with name.png'),
          ),
        ),
      ),
    );
  }
}
