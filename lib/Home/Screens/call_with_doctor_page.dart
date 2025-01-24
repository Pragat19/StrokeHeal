import 'package:flutter/material.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/Model/CallAndCopyButton.dart';
import 'package:strokeheal/Home/widget.dart';
import '../Model/Whatshapp_video_call.dart';
import '../mainDrawer.dart';

// ignore: camel_case_types
class video_conferance_screen extends StatefulWidget {
  const video_conferance_screen({super.key});
  @override
  State<video_conferance_screen> createState() =>
      _video_conferance_screenState();
}

// ignore: camel_case_types
class _video_conferance_screenState extends State<video_conferance_screen> {
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var doctor_name = <String>[
      'Dr. Prashant Patel (MPT Neuro.)',
      'Dr. Devang Mehta (MPT Neuro.)',
      'Dr. Krinal Gajera (MPT Neuro.)',
      'Dr. Kiran Barad (MPT Neuro.)',
      'Dr. Chandani Zolapura (MPT Neuro.)',
      'Dr. Pinal Patel (MPT Neuro.)',
      'Dr. Meeti Naik (MPT Neuro.)',
      'Dr. Naongmuong Chang (MPT Neuro.)',
      'Dr. Priyanka Valand (MPT Neuro.)',
      'Dr. Chitra Sharma (MPT Neuro.)',
      'Dr. Vidhi Bhanushali (MPT Neuro.)',
      'Dr. Aavruti Vora (MPT Neuro.)',
      'Dr. Reeva Nagar (BPT)',
      'Dr. Riya Oza (BPT)',
      'Dr. Mahek Desai (BPT)',
      'Dr. Sanket Hundlani (BPT)',
      'Dr. Yesha Patel (BPT)',
    ];

    var number = <num>[
      9974298770,
      9016205960,
      9510115544,
      7046973609,
      7046973609,
      8866380246,
      7203017645,
      8974190928,
      9574337038,
      7016936280,
      9978004375,
      7621953890,
      9909419591,
      9327511773,
      9727471095,
      7043248632,
      7043611349
    ];

    return Scaffold(
      appBar: default_appbar(context, translation(context).online_consult),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: SizedBox(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  title: Text(
                    doctor_name[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    children: [
                      CallAndCopyButton(
                        phoneNumber: number[index].toString(),
                      ),
                    ],
                  ),
                  trailing: WhatsAppVideoCallButton(
                      phoneNumber: number[index].toString()),
                ),
              );
            },
            itemCount: doctor_name.length,
            padding: const EdgeInsets.only(bottom: 40),
          ),
        ),
      ),
    );
  }
}
