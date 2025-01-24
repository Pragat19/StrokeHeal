// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 120, left: 25),
            child: Text(
              "Find your",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              "Doctor Online!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(fixedSize: const Size(190, 50)),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Get Started",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    )
                  ],
                )),
          ),
          Image.asset(
            "assets/image/slider1.png",
            height: 520,
            width: width,
          )
        ],
      ),
    );
  }
}
