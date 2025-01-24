import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:strokeheal/Home/Model/add_exsersice_repository.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import '../../Authentications/Model/User_Repository.dart';

class Excersice_Record extends StatefulWidget {
  const Excersice_Record({super.key, required this.currentdate});

  final String currentdate;

  @override
  State<Excersice_Record> createState() => _Excersice_RecordState();
}

class _Excersice_RecordState extends State<Excersice_Record> {
  final _formkey = GlobalKey<FormState>();

  String excersice_ans = "YES";

  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();

  Future<void> _Start_selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );

    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _end_selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );

    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  String? total_exsercise_time;

  void _calculateWorkoutTime() {
    // Convert TimeOfDay to minutes
    int startMinutes = _startTime.hour * 60 + _startTime.minute;
    int endMinutes = _endTime.hour * 60 + _endTime.minute;

    // Calculate workout time in minutes
    int workoutTime = endMinutes - startMinutes;

    // Convert workout time back to TimeOfDay format
    int hours = workoutTime ~/ 60;
    int minutes = workoutTime % 60;

    // Display the total workout time
    log('Total workout time: $hours hours $minutes minutes');
    setState(() {
      total_exsercise_time = '${hours}h ${minutes}min';
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: default_appbar(context, "Add Excersice"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
          child: Form(
            key: _formkey,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Complate your Workout ?",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              CustomRadioButton(
                                elevation: 0,
                                // absoluteZeroSpacing: false,
                                unSelectedColor: Theme.of(context).canvasColor,
                                buttonLables: const [
                                  'Yes',
                                  'No',
                                ],
                                buttonValues: const [
                                  "YES",
                                  "NO",
                                ],

                                enableShape: true,
                                buttonTextStyle: const ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.black,
                                  textStyle: TextStyle(fontSize: 16),
                                ),
                                wrapAlignment: WrapAlignment.start,
                                radioButtonValue: (value) {
                                  setState(() {
                                    log("$value");
                                    excersice_ans = value.toString();
                                  });
                                },
                                selectedColor: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          excersice_ans.toString() == "NO"
                              ? const Row()
                              : Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Start time :",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _Start_selectTime(context);
                                                log(widget.currentdate);
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 150,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        126, 189, 189, 189)),
                                                child: Center(
                                                    child: Text(_startTime
                                                        .format(context)
                                                        .toString())),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "End time :",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                _end_selectTime(context);
                                              },
                                              child: Container(
                                                height: 50,
                                                width: 150,
                                                decoration: const BoxDecoration(
                                                    color: Color.fromARGB(
                                                        126, 189, 189, 189)),
                                                child: Center(
                                                    child: Text(_endTime
                                                        .format(context)
                                                        .toString())),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        readOnly: true,
                                        onTap: () => setState(() {
                                              _calculateWorkoutTime();
                                            }),
                                        decoration: InputDecoration(
                                            labelText: "Total Excersice Time",
                                            labelStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.red)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.grey)),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                    color: Colors.red)),
                                            hintText: total_exsercise_time.toString()))
                                  ],
                                ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          mini: false,
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () async {
            int? userid = await get_CurrentUser_UserId();
            log("On Button Click User ID------ : ${userid}");
            AddExser_Repo formRepository = AddExser_Repo();

            formRepository.add_Exsersice(
                userid.toString(),
                widget.currentdate,
                widget.currentdate,
                excersice_ans,
                _startTime.format(context).toString(),
                _endTime.format(context).toString(),
                total_exsercise_time.toString());
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          )),
    );
  }
}
