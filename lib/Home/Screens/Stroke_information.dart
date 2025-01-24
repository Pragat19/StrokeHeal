// ignore_for_file: camel_case_types, use_build_context_synchronously, file_names

import 'package:flutter/material.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/mainDrawer.dart';
import 'package:strokeheal/Home/widget.dart';

class information_screen extends StatefulWidget {
  const information_screen({super.key});

  @override
  State<information_screen> createState() => _information_screenState();
}

class _information_screenState extends State<information_screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: default_appbar(
          context,
          translation(context).stroke,
        ),
        drawer: const MainDrawer(),
        drawerScrimColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.01, right: width * 0.01, top: height * 0.02),
            child: Column(
              children: [
                Card(
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          infoTextStyle(translation(context).info_p1),
                          const SizedBox(
                            height: 15,
                          ),
                          infoTextStyle(translation(context).info_p2),
                          const SizedBox(
                            height: 15,
                          ),
                          infoTextStyle(translation(context).info_p3),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child:
                                  titleTextStyle(translation(context).title1)),
                          const SizedBox(
                            height: 5,
                          ),
                          infoTextStyle(translation(context).info_p4),
                          const SizedBox(
                            height: 20,
                          ),
                          sub_titleTextStyle(translation(context).title2),
                          const SizedBox(
                            height: 5,
                          ),
                          infoTextStyle(translation(context).info_p5),
                          const SizedBox(
                            height: 20,
                          ),
                          sub_titleTextStyle(translation(context).title3),
                          const SizedBox(
                            height: 5,
                          ),
                          infoTextStyle(translation(context).info_p6),
                          const SizedBox(
                            height: 20,
                          ),
                          sub_titleTextStyle(translation(context).title4),
                          const SizedBox(
                            height: 5,
                          ),
                          infoTextStyle(translation(context).info_p7),
                          const SizedBox(
                            height: 20,
                          ),
                          sub_titleTextStyle(translation(context).title5),
                          const SizedBox(
                            height: 5,
                          ),
                          infoTextStyle(translation(context).info_p8),
                          const SizedBox(
                            height: 20,
                          ),
                          sub_titleTextStyle(translation(context).title6),
                          const SizedBox(
                            height: 5,
                          ),
                          infoTextStyle(translation(context).info_p9),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: titleTextStyle(
                                    translation(context).title7)),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p10),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title8),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p11),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title9),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p12),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title10),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p13),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title11),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p14),
                            const SizedBox(
                              height: 15,
                            ),
                            infoTextStyle(translation(context).info_p15),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Card(
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: titleTextStyle(
                                    translation(context).title12)),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p16),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title13),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p17),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title14),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p18),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title15),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p19),
                            const SizedBox(
                              height: 20,
                            ),
                            sub_titleTextStyle(translation(context).title16),
                            const SizedBox(
                              height: 5,
                            ),
                            infoTextStyle(translation(context).info_p20),
                            const SizedBox(
                              height: 15,
                            ),
                            infoTextStyle(translation(context).info_p21),
                            const SizedBox(
                              height: 15,
                            ),
                            infoTextStyle(translation(context).info_p22),
                            const SizedBox(
                              height: 15,
                            ),
                            infoTextStyle(translation(context).info_p23),
                            const SizedBox(
                              height: 15,
                            ),
                            infoTextStyle(translation(context).info_p24),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
