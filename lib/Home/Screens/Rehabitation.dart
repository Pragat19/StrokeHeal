// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, non_constant_identifier_names

import "package:flutter/material.dart";
import 'package:strokeheal/Home/Screens/Upper_Limb_ex.dart';
import "package:strokeheal/Home/mainDrawer.dart";
import "package:strokeheal/Home/widget.dart";
import "package:strokeheal/Widget.dart";

import "../../Classes/language_constants.dart";

class Rehabitation_page extends StatefulWidget {
  const Rehabitation_page({super.key});

  @override
  State<Rehabitation_page> createState() => _Rehabitation_pageState();
}

class _Rehabitation_pageState extends State<Rehabitation_page> {
  List<String> exersice_Images = [
    "assets/image/uperlimb.png",
    "assets/image/trunk.png",
    "assets/image/lowerlimb.png",
    "assets/image/hand grip.png",
    "assets/image/gait train.png",
    "assets/image/speech therapy.png"
  ];

  List<String> exersice_Name = [
    "Upper Limb",
    "Trunk",
    "LowerLimb",
    "Hand Grip",
    "Gait Training",
    "Speech therapy"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: default_appbar(context, translation(context).rehabitation),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.02),
                child: Center(
                    child: Text(
                  "Available Exersice Videos",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: SizedBox(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.82,
                            crossAxisSpacing: width * 0.01,
                            mainAxisSpacing: height * 0.01),
                        itemCount: exersice_Images.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              nextScreen(
                                  context,
                                  Upper_Limb(
                                    exersice_category: exersice_Name[index],
                                  ));
                            },
                            child: Card(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(exersice_Images[index]),
                                  height: height * 0.2,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: height * 0.03),
                                  child: Text(
                                    exersice_Name[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            )),
                          );
                        })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
