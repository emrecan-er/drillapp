import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart' as time;
import 'package:deprem/constants/constants.dart';
import 'package:deprem/controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';

class Drill extends StatelessWidget {
  var dateFormat = DateFormat('yyyy-MM-dd');

  StateController _stateController = Get.put(StateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('We are still working on it'),
                      content: Container(
                        height: 20,
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.paste,
              size: 18,
            ),
          ),
        ],
        title: Text(
          'Drill',
          style: TextStyle(
            fontFamily: 'VarelaRound',
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 40,
        elevation: 0,
        backgroundColor: kMainColor,
      ),
      backgroundColor: kbackgroundColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: kMainColor,
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      nextMonthIcon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: kbackgroundColor,
                      ),
                      controlsTextStyle: TextStyle(
                          color: kbackgroundColor, fontFamily: 'VarelaRound'),
                      lastMonthIcon: Icon(
                        Icons.keyboard_arrow_left_outlined,
                        color: kbackgroundColor,
                      ),
                      selectedDayHighlightColor:
                          kbackgroundColor.withOpacity(0.4),
                      selectedYearTextStyle: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: kbackgroundColor,
                      ),
                      dayTextStyle: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: kbackgroundColor,
                      ),
                      weekdayLabelTextStyle: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: kbackgroundColor.withOpacity(0.5),
                      ),
                      disabledDayTextStyle: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: kbackgroundColor.withOpacity(0.5),
                      ),
                      yearTextStyle: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: kbackgroundColor,
                      ),
                      selectedDayTextStyle: TextStyle(
                        fontFamily: 'VarelaRound',
                        color: kbackgroundColor,
                      ),
                      calendarType: CalendarDatePicker2Type.single,
                    ),
                    onValueChanged: (dates) {
                      var inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS");
                      var inputDate = inputFormat.parse(dates[0].toString());

                      var outputFormat = DateFormat("dd.MM.yyyy");
                      var formattedDate = outputFormat.format(inputDate);
                      _stateController.selectedDate.value =
                          formattedDate.toString();
                    },
                    value: [],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 32, bottom: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'drill app',
                            style: TextStyle(
                              letterSpacing: 2,
                              color: kbackgroundColor,
                              fontFamily: 'AdriaGrotesk',
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              showPicker(
                                accentColor: kMainColor,
                                okStyle: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.bold,
                                  color: kMainColor,
                                ),
                                cancelStyle: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  fontWeight: FontWeight.bold,
                                  color: kMainColor,
                                ),
                                width: Get.width,
                                height: 400,
                                showSecondSelector: true,
                                context: context,
                                value: time.Time(hour: 5, minute: 50),
                                onChange: (p0) {
                                  _stateController.selectedTime.value =
                                      p0.format(context);
                                  log(p0.format(context));
                                },
                                minuteInterval: TimePickerInterval.FIVE,
                                onChangeDateTime: (DateTime dateTime) {
                                  debugPrint("[debug datetime]:  $dateTime");
                                },
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kbackgroundColor),
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(8)),
                            width: 100,
                            height: 40,
                            child: Center(
                                child: Text(
                              'Select Time',
                              style: TextStyle(
                                fontFamily: 'VarelaRound',
                                color: kbackgroundColor,
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: kbackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              width: Get.width,
              height: 200,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Schedule an Earthquake Drill',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'VarelaRound',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Selected Date :',
                          style: TextStyle(
                            fontFamily: 'VarelaRound',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => Text(
                            _stateController.selectedDate.value,
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Text(
                          'Selected Time :',
                          style: TextStyle(
                            fontFamily: 'VarelaRound',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(
                          () => Text(
                            _stateController.selectedTime.value,
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      AwesomeDialog(
                        titleTextStyle: TextStyle(
                            fontFamily: 'VarelaRound',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        descTextStyle: TextStyle(
                          fontFamily: 'VarelaRound',
                        ),
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'Done',
                        desc: 'Drill has been scheduled.',
                        btnOkOnPress: () {},
                      )..show();
                    },
                    child: Container(
                      width: Get.width / 3,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: kMainColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Schedule',
                          style: TextStyle(
                            fontFamily: 'VarelaRound',
                            letterSpacing: 1,
                            color: kMainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
