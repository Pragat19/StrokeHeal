import 'package:flutter/material.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/mainDrawer.dart';
import 'package:strokeheal/Home/widget.dart';

class Relaxation_screen extends StatefulWidget {
  const Relaxation_screen({super.key});

  @override
  State<Relaxation_screen> createState() => _Relaxation_screenState();
}

class _Relaxation_screenState extends State<Relaxation_screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: default_appbar(context, translation(context).relax),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.02, bottom: height * 0.02),
                child: Center(
                    child: Text(
                  translation(context).psychological_support,
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'ALGER',
                      fontWeight: FontWeight.w500),
                )),
              ),
              titleTextStyle(translation(context).excersise),
              SizedBox(
                height: height * 0.02,
              ),
              sub_titleTextStyle("1. ${translation(context).rela_tx1}"),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.07, top: height * 0.002),
                child: Column(
                  children: [
                    numbered_TextItem(1, translation(context).rela_tx11),
                    numbered_TextItem(2, translation(context).rela_tx12),
                    numbered_TextItem(3, translation(context).rela_tx13),
                    numbered_TextItem(4, translation(context).rela_tx14),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              sub_titleTextStyle("2.  ${translation(context).rela_tx2}"),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.07, top: height * 0.002),
                child: Column(
                  children: [
                    numbered_TextItem(1, translation(context).rela_tx21),
                    numbered_TextItem(2, translation(context).rela_tx22),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              sub_titleTextStyle("3.  ${translation(context).rela_tx3}"),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.07, top: height * 0.002),
                child: Column(
                  children: [
                    numbered_TextItem(1, translation(context).rela_tx31),
                    numbered_TextItem(2, translation(context).rela_tx32),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              sub_titleTextStyle("4.  ${translation(context).rela_tx4}"),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.07, top: height * 0.002),
                child: Column(
                  children: [
                    numbered_TextItem(1, translation(context).rela_tx41),
                    numbered_TextItem(2, translation(context).rela_tx42),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
