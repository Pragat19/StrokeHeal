// ignore_for_file: file_names, unnecessary_const, unnecessary_string_escapes,

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:strokeheal/Authentications/Login_Screen.dart';

class SliderImageScreen extends StatefulWidget {
  const SliderImageScreen({super.key});

  @override
  State<SliderImageScreen> createState() => _SliderImageScreenState();
}

class _SliderImageScreenState extends State<SliderImageScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/image/$assetName', width: width);
  }

  ButtonStyle _buttonstyle() {
    return const ButtonStyle(
        overlayColor: const WidgetStatePropertyAll(Colors.transparent));
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: bodyStyle,
      pageMargin: EdgeInsets.only(top: 50),
      bodyPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 4000,
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: _buildImage('Logo.png', 50),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome!",
          body: "I am provide a Best Doctor or Best knowledge about Stroke",
          image: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: _buildImage('dres_ico.png', 330),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Let\'s Consult the Best Doctor",
          body:
              "Manage appointments with your doctor, and get accurate information",
          image: _buildImage('Slider2_img.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Your Doctor\n Anytime.\n Anywhere",
          body: "More than 500+ specialist doctors are ready to serve you",
          decoration: pageDecoration.copyWith(
            bodyFlex: 2,
            imageFlex: 4,
            bodyAlignment: Alignment.bottomCenter,
            imageAlignment: Alignment.topCenter,
          ),
          image: _buildImage('Slider3_img.png'),
          reverse: true,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,

      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      skipStyle: _buttonstyle(),
      next: const Icon(Icons.arrow_forward),
      nextStyle: _buttonstyle(),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      doneStyle: _buttonstyle(),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
