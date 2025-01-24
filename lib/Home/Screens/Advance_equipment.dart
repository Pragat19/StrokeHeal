// ignore_for_file: non_constant_identifier_names, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/mainDrawer.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Adv_equipment_screen extends StatefulWidget {
  const Adv_equipment_screen({super.key});

  @override
  State<Adv_equipment_screen> createState() => _Adv_equipment_screenState();
}

class _Adv_equipment_screenState extends State<Adv_equipment_screen> {
  List<String> equipment_Images = [
    "assets/image/Ankle.png",
    "assets/image/knee.png",
    "assets/image/robotic.png",
    "assets/image/splint.png",
    "assets/image/CIMT.png",
  ];

  List<String> equipment_name = [
    "Ankle Foot Orthosis",
    "Knee Brace",
    "Hand Robotic Gloves",
    "Hand Splint",
    "CIMT"
  ];

  void _launchGoogleSearch(searchText) async {
    final url = 'https://www.google.com/search?q=$searchText';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: default_appbar(context, translation(context).adv_equip),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: SizedBox(
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.82,
                          crossAxisSpacing: width * 0.01,
                          mainAxisSpacing: height * 0.01),
                      itemCount: equipment_Images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _launchGoogleSearch(equipment_name[index]);
                          },
                          child: Card(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(equipment_Images[index]),
                                height: height * 0.2,
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: height * 0.02),
                                child: Text(
                                  equipment_name[index],
                                  style: const TextStyle(
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
    );
  }
}
