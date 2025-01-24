// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:strokeheal/Classes/language_constants.dart';
import 'package:strokeheal/Home/Screens/Add_Excersice_record.dart';
import 'package:strokeheal/Home/mainDrawer.dart';
import 'package:strokeheal/Home/widget.dart';
import 'package:intl/intl.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:strokeheal/Widget.dart';

class Reminder_Screen extends StatefulWidget {
  const Reminder_Screen({super.key});

  @override
  State<Reminder_Screen> createState() => _Reminder_ScreenState();
}

class _Reminder_ScreenState extends State<Reminder_Screen> {
  DateTime? startDate;
  DateTime? endDate;

  List<DateTime> _getDaysInBetween(DateTime startDate, DateTime endDate) {
    final List<DateTime> dates = [];
    for (var i = startDate;
        i.isBefore(endDate.add(Duration(days: 1)));
        i = i.add(Duration(days: 1))) {
      dates.add(i);
    }
    return dates;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    List<DateTime> dates = [];
    if (startDate != null && endDate != null) {
      dates = _getDaysInBetween(startDate!, endDate!);
    }

    return Scaffold(
      appBar: default_appbar(context, translation(context).reminder),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 18, bottom: 16),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(right: 10, top: 20),
            child: startDate == null && endDate == null
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Please Select the Exercise Dates',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Colors.black),
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: height * 0.78,
                        child: ListView.builder(
                          itemCount: dates.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                nextScreen(
                                    context,
                                    Excersice_Record(
                                      currentdate: '${dates[index].toString()}',
                                    ));
                              },
                              child: Card(
                                shadowColor: Colors.transparent,
                                clipBehavior: Clip.antiAlias,
                                child: SizedBox(
                                  height: 130,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 14,
                                        child: Container(
                                          child: ListTile(
                                            title: Text(
                                                DateFormat("dd - MMM - yyyy")
                                                    .format(dates[index])),
                                            titleTextStyle: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                            subtitle: Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text(
                                                "Add Today's Exercise Record..",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            trailing: Icon(
                                              Icons.arrow_forward_ios_sharp,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          showCustomDateRangePicker(
            context,
            dismissible: true,
            minimumDate: DateTime.now().subtract(const Duration(days: 30)),
            maximumDate: DateTime.now().add(const Duration(days: 30)),
            endDate: endDate,
            startDate: startDate,
            backgroundColor: Colors.white,
            primaryColor: Theme.of(context).primaryColor,
            onApplyClick: (start, end) {
              setState(() {
                endDate = end;
                startDate = start;
              });
            },
            onCancelClick: () {
              setState(() {
                endDate = null;
                startDate = null;
              });
            },
          );
        },
        tooltip: 'Choose Date Range',
        child: const Icon(
          Icons.calendar_today_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
