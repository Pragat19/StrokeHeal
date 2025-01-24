// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names, unused_element, unnecessary_brace_in_string_interps, file_names, unnecessary_string_interpolations, use_build_context_synchronously

import 'dart:developer';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:strokeheal/Authentications/Model/User_Repository.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/mainDrawer.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:intl/intl.dart';

import '../../Classes/Age.dart';
import '../Model/Form_Repository.dart';

class self_Evaluation_Page extends StatefulWidget {
  const self_Evaluation_Page({super.key});

  @override
  State<self_Evaluation_Page> createState() => _self_Evaluation_PageState();
}

class _self_Evaluation_PageState extends State<self_Evaluation_Page> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController medical_condition_controller =
      TextEditingController();
  final TextEditingController suffered_stroke_controller =
      TextEditingController();

  String gender_value = "";

  DateTime? _selectedDate;
  String _totalAge = '';

  // Radio Button Default Values
  String? _medical_condition;
  String? _suffered_stroke;
  String? _getUp_from_bed;
  String? _sitON_the_bed;
  String? _standUp_from_bedORchair;
  String? _able_to_walk;
  String? _able_to_use_toilet;
  String? _comb_my_hair;
  String? _eat_food;
  String? _able_to_dress;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: default_appbar(context, translation(context).self_evalu),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.only(
                left: width * 0.04, right: width * 0.04, top: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Fill Up This Form',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
                ),

                // Name
                SizedBox(
                  height: height * 0.03,
                ),
                inputField(context, _nameController, TextInputType.name,
                    "Enter Your Name", "Patient Name", "Enter Valid Name"),

                // Address
                SizedBox(
                  height: height * 0.03,
                ),
                inputField(
                    context,
                    _addressController,
                    TextInputType.streetAddress,
                    "Where Are You From ?",
                    "Address",
                    "Enter Valid Address"),
                SizedBox(
                  height: height * 0.03,
                ),
                const Text('Select Your Gender :',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.015,
                ),

                // Gender
                CustomRadioButton(
                  elevation: 0,
                  // absoluteZeroSpacing: false,
                  unSelectedColor: Theme.of(context).canvasColor,
                  buttonLables: const [
                    'Male',
                    'Female',
                    'Other',
                  ],
                  buttonValues: const [
                    "MALE",
                    "FEMALE",
                    "OTHER",
                  ],

                  enableShape: true,
                  buttonTextStyle: const ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  radioButtonValue: (value) {
                    log("$value");
                    gender_value = value.toString();
                  },
                  selectedColor: Theme.of(context).primaryColor,
                ),

                // DOB
                SizedBox(
                  height: height * 0.03,
                ),
                TextFormField(
                  controller: _selectedDate == null
                      ? TextEditingController(text: null)
                      : TextEditingController(
                          text:
                              DateFormat('dd/MM/yyyy').format(_selectedDate!)),
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_today),
                      labelText: "Date Of Birth",
                      labelStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.red)),
                      helperText: _selectedDate == null
                          ? null
                          : "Your Age : $_totalAge"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Select Date of Birth !!";
                    }
                    return null;
                  },
                ),

                // Height
                SizedBox(height: height * 0.03),
                inputField(
                  context,
                  heightController,
                  TextInputType.number,
                  "0.00 cm",
                  "Height (CM)",
                  "Enter Valid Height",
                ),

                // Weight
                SizedBox(height: height * 0.03),
                inputField(
                  context,
                  weightController,
                  TextInputType.number,
                  "50.00 KG",
                  "Weight (KG)",
                  "Enter Valid Weight",
                ),

                // Medical Condition
                SizedBox(
                  height: height * 0.03,
                ),
                const Text('Any medical condition you have ?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _medical_condition,
                      onChanged: (val) {
                        setState(() {
                          _medical_condition = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _medical_condition,
                        onChanged: (val) {
                          setState(() {
                            _medical_condition = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                _medical_condition == "Yes"
                    ? inputField(
                        context,
                        medical_condition_controller,
                        TextInputType.text,
                        "Write your medical conditions",
                        "Medical Conditions",
                        "It's required !!",
                      )
                    : const Row(),

                // Ever Suffered from a stroke
                SizedBox(
                  height: height * 0.015,
                ),
                const Text('Have you ever suffered from a stroke ?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _suffered_stroke,
                      onChanged: (val) {
                        setState(() {
                          _suffered_stroke = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _suffered_stroke,
                        onChanged: (val) {
                          setState(() {
                            _suffered_stroke = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                _suffered_stroke == "Yes"
                    ? inputField(
                        context,
                        suffered_stroke_controller,
                        TextInputType.number,
                        "Enter Number of Months....",
                        "I have Stroke since..",
                        "It's required !!",
                      )
                    : const Row(),

                // get up from bed
                SizedBox(
                  height: height * 0.015,
                ),
                const Text('You have able to get up from bed ?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _getUp_from_bed,
                      onChanged: (val) {
                        setState(() {
                          _getUp_from_bed = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _getUp_from_bed,
                        onChanged: (val) {
                          setState(() {
                            _getUp_from_bed = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                // I am able to sit on the bed without support.
                SizedBox(
                  height: height * 0.01,
                ),
                const Text('You have able to sit on the bed without support?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _sitON_the_bed,
                      onChanged: (val) {
                        setState(() {
                          _sitON_the_bed = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _sitON_the_bed,
                        onChanged: (val) {
                          setState(() {
                            _sitON_the_bed = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                // I am able to stand from bed or chair without any support.
                SizedBox(
                  height: height * 0.01,
                ),
                const Text(
                    'You have able to stand from bed or chair without any support?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _standUp_from_bedORchair,
                      onChanged: (val) {
                        setState(() {
                          _standUp_from_bedORchair = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _standUp_from_bedORchair,
                        onChanged: (val) {
                          setState(() {
                            _standUp_from_bedORchair = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                // I am able to walk....
                SizedBox(
                  height: height * 0.01,
                ),
                const Text('I am able to walk....',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                RadioListTile(
                    value: "Without_Support",
                    title: const Text('Without Support / Independently'),
                    groupValue: _able_to_walk,
                    onChanged: (val) {
                      setState(() {
                        _able_to_walk = val!;
                      });
                    }),
                RadioListTile(
                    value: "With_Minimum_Support",
                    title: const Text('With Minimum Support'),
                    groupValue: _able_to_walk,
                    onChanged: (val) {
                      setState(() {
                        _able_to_walk = val!;
                      });
                    }),
                RadioListTile(
                    value: "With_Full_Support",
                    title: const Text('With Full Support'),
                    groupValue: _able_to_walk,
                    onChanged: (val) {
                      setState(() {
                        _able_to_walk = val!;
                        log("$_able_to_walk.");
                      });
                    }),

                // I am able to use the toilet...
                SizedBox(
                  height: height * 0.02,
                ),

                const Text('You have able to use the toilet...',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                RadioListTile(
                    value: "Independentally",
                    title: const Text('Independently'),
                    groupValue: _able_to_use_toilet,
                    onChanged: (val) {
                      setState(() {
                        _able_to_use_toilet = val!;
                      });
                    }),
                RadioListTile(
                    value: "With_Minimum_Assistance",
                    title: const Text('With Minimal Assistance'),
                    groupValue: _able_to_use_toilet,
                    onChanged: (val) {
                      setState(() {
                        _able_to_use_toilet = val!;
                      });
                    }),
                RadioListTile(
                    value: "With_Full_Assistance",
                    title: const Text('With Full Assistance'),
                    groupValue: _able_to_use_toilet,
                    onChanged: (val) {
                      setState(() {
                        _able_to_use_toilet = val!;
                      });
                    }),

                // I am able to comb my Hair independently.
                SizedBox(
                  height: height * 0.02,
                ),

                const Text('You have able to comb your hair Independently?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _comb_my_hair,
                      onChanged: (val) {
                        setState(() {
                          _comb_my_hair = val;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _comb_my_hair,
                        onChanged: (val) {
                          setState(() {
                            _comb_my_hair = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                //You have able to eat food by Yourself?
                SizedBox(
                  height: height * 0.02,
                ),

                const Text('You have able to eat food by Yourself?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _eat_food,
                      onChanged: (val) {
                        setState(() {
                          _eat_food = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _eat_food,
                        onChanged: (val) {
                          setState(() {
                            _eat_food = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                // I am able to Dress myself
                SizedBox(
                  height: height * 0.02,
                ),

                const Text('You have able to Dress Yourself?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                Row(children: [
                  Radio(
                      value: "Yes",
                      groupValue: _able_to_dress,
                      onChanged: (val) {
                        setState(() {
                          _able_to_dress = val!;
                        });
                      }),
                  const Text('Yes', style: TextStyle(fontSize: 15)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Radio(
                        value: "No",
                        groupValue: _able_to_dress,
                        onChanged: (val) {
                          setState(() {
                            _able_to_dress = val!;
                          });
                        }),
                  ),
                  const Text('No', style: TextStyle(fontSize: 15))
                ]),

                SizedBox(
                  height: height * 0.03,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(width * 0.5, height * 0.07),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {
                      int? userid = await get_CurrentUser_UserId();
                      log("On Button Click User ID------ : ${userid}");
                      FormRepository formRepository = FormRepository();

                      log("Clear -----------");
                      if (_formkey.currentState!.validate()) {
                        if (gender_value != "" &&
                            _medical_condition != null &&
                            _suffered_stroke != null &&
                            _getUp_from_bed != null &&
                            _sitON_the_bed != null &&
                            _standUp_from_bedORchair != null &&
                            _able_to_walk != null &&
                            _able_to_use_toilet != null &&
                            _comb_my_hair != null &&
                            _eat_food != null &&
                            _able_to_dress != null) {
                          formRepository.form_Submit(
                            userid.toString(),
                            _nameController.text,
                            _addressController.text,
                            gender_value,
                            _selectedDate.toString(),
                            _totalAge,
                            heightController.text,
                            weightController.text,
                            _medical_condition!,
                            medical_condition_controller.text,
                            _suffered_stroke!,
                            suffered_stroke_controller.text,
                            _getUp_from_bed!,
                            _sitON_the_bed!,
                            _standUp_from_bedORchair!,
                            _able_to_walk!,
                            _able_to_use_toilet!,
                            _comb_my_hair!,
                            _eat_food!,
                            _able_to_dress!,
                          );

                          setState(() {
                            clearField();
                          });

                          MotionToast.success(
                            title: const Text(
                              "Form Submited ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            description: const Text(
                                "Yor Evaluation form submited Successfully"),
                            position: MotionToastPosition.top,
                            barrierColor: Colors.black.withOpacity(0.3),
                            width: 300,
                            height: 80,
                            dismissable: true,
                            toastDuration: const Duration(seconds: 3),
                          ).show(context);
                        } else {
                          MotionToast.error(
                            title: const Text(
                              "Select All Valid Option",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            description: const Text(
                                "All options are selected to submit the form"),
                            position: MotionToastPosition.top,
                            barrierColor: Colors.black.withOpacity(0.3),
                            width: 300,
                            height: 80,
                            dismissable: true,
                            toastDuration: const Duration(seconds: 3),
                          ).show(context);
                        }
                      } else {
                        MotionToast.error(
                          title: const Text(
                            "Enter Valid Answers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          description: const Text(
                              "All Fields are required Please Fill up carefully"),
                          position: MotionToastPosition.top,
                          barrierColor: Colors.black.withOpacity(0.3),
                          width: 300,
                          height: 80,
                          dismissable: true,
                          toastDuration: const Duration(seconds: 3),
                        ).show(context);
                      }
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          letterSpacing: 2),
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  clearField() {
    _nameController.clear();
    _addressController.clear();
    _selectedDate = null;
    gender_value = "";
    heightController.clear();
    weightController.clear();
    medical_condition_controller.clear();
    suffered_stroke_controller.clear();
    _medical_condition = "";
    _suffered_stroke = "";
    _getUp_from_bed = "";
    _sitON_the_bed = "";
    _standUp_from_bedORchair = "";
    _able_to_walk = "";
    _able_to_use_toilet = "";
    _comb_my_hair = "";
    _eat_food = "";
    _able_to_dress = "";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calculateAge();
      });
    }
  }

  void _calculateAge() {
    final now = DateTime.now();
    final difference = now.difference(_selectedDate!);
    final age = Age.fromDuration(difference);
    setState(() {
      _totalAge = '${age.years} Years';
    });
  }
}
