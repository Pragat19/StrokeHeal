// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:video_player/video_player.dart';
import '../../Classes/Language.dart';
import '../../Classes/language_constants.dart';
import '../../main.dart';
import '../VideoItem.dart';

class Upper_Limb extends StatefulWidget {
  const Upper_Limb({super.key, required this.exersice_category});

  final String exersice_category;
  @override
  State<Upper_Limb> createState() => _Upper_LimbState();
}

class _Upper_LimbState extends State<Upper_Limb> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    List<String> titles = <String>[
      translation(context).solder_flexion,
      translation(context).weight_bearing,
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      animationDuration: Duration(milliseconds: 0),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarHeight: 50,
            backgroundColor: Theme.of(context).primaryColor,
            titleTextStyle: const TextStyle(fontSize: 22, color: Colors.white),
            title: Text(
              '${widget.exersice_category}',
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: width * 0.03),
                child: DropdownButton<Language>(
                  underline: const SizedBox(),
                  icon: const Icon(
                    Icons.g_translate,
                    color: Colors.white,
                    size: 25,
                  ),
                  onChanged: (Language? language) async {
                    if (language != null) {
                      Locale _locale = await setLocale(language.languageCode);
                      MyApp.setLocale(context, _locale);
                    }
                  },
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>(
                        (e) => DropdownMenuItem<Language>(
                          value: e,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                e.flag,
                                style: const TextStyle(fontSize: 25),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                e.name,
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
            notificationPredicate: (ScrollNotification notification) {
              return notification.depth == 1;
            },
            bottom: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.only(left: 10, right: 10),
              indicatorWeight: 5,
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              tabs: <Widget>[
                Tab(
                  text: titles[0],
                ),
                Tab(
                  text: titles[1],
                ),
              ],
            ),
          ),
          body: upperlimb(context, height, width, titles[0], titles[1])),
    );
  }
}

TabBarView upperlimb(context, height, width, ex1_title, ex2_title) {
  return TabBarView(children: [
    SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Center(
                child: rehabi_sub_titleTextStyle(
              ex1_title,
            )),
            VideoItems(
              videoPlayerController: VideoPlayerController.asset(
                'assets/video/UL1.mp4',
              ),
              looping: true,
              autoplay: true,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            numbered_TextItem(1, translation(context).ult1),
            numbered_TextItem(2, translation(context).ult2),
            numbered_TextItem(3, translation(context).ult3),
            numbered_TextItem(4, translation(context).ult4),
            numbered_TextItem(5, translation(context).ult5),
          ],
        ),
      ),
    ),
    SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Center(
                child: rehabi_sub_titleTextStyle(
              ex2_title,
            )),
            VideoItems(
              videoPlayerController: VideoPlayerController.asset(
                'assets/video/UL2.mp4',
              ),
              looping: true,
              autoplay: true,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            numbered_TextItem(1, translation(context).ult21),
            numbered_TextItem(2, translation(context).ult22),
            numbered_TextItem(3, translation(context).ult23),
            numbered_TextItem(4, translation(context).ult24),
          ],
        ),
      ),
    ),
  ]);
}
