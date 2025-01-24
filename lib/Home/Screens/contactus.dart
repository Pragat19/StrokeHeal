// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../mainDrawer.dart';

class contact_screen extends StatefulWidget {
  const contact_screen({super.key});

  @override
  State<contact_screen> createState() => _contact_screenState();
}

class _contact_screenState extends State<contact_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: default_appbar(context, translation(context).contact_us),

      drawer: MainDrawer(),

      body: Padding(
        padding: const EdgeInsets.only(top: 20,left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dr. Prashant Patel',style: TextStyle(fontSize: 23,fontFamily: 'ALGER'),),
            TextButton(onPressed: (() {
              _makePhoneCall(context, 9974298770);
            }), 
              child: Text('+91 9974298770',style: TextStyle(fontSize: 16,))),
            
            Text('Er. Pragat Patel',style: TextStyle(fontSize: 23,fontFamily: 'ALGER'),),
            
            TextButton(onPressed:() => _makePhoneCall(context, "9727021685"), 
              child: Text('+91 9727021685',style: TextStyle(fontSize: 16,))),
              
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.location_on,color: Colors.blue,)),
                    ],
                  ),

                    Wrap(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text('College of Engineering,',style: TextStyle(fontSize: 18,fontFamily: 'ITCKRIST',fontWeight: FontWeight.w500)),
                        Text(''),
                        Text('GEC Palanpur',style: TextStyle(fontSize: 16,)),
                        Text('385001',style: TextStyle(fontSize: 16,))
                          ],
                        ),

                      ],
                  )

                ],
              ),
            ),

          ]
        ),
      ),
    );
  }
  void _makePhoneCall(BuildContext context, phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      _displayErrorMotionToast(
          context, "Error", "Could not launch $phoneNumber");
    }
  }

  void _displayErrorMotionToast(
      BuildContext context, String title, String description) {
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(description),
      position: MotionToastPosition.top,
      barrierColor: Colors.black.withOpacity(0.3),
      width: 300,
      height: 80,
      dismissable: true,
      toastDuration: const Duration(seconds: 3),
    ).show(context);
  }
}