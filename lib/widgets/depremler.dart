import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deprem/constants/constants.dart';
import 'package:deprem/service/api/earthquake_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'earthquake_card.dart';

class Earthquakes extends StatelessWidget {
  final EarthquakeController _earthquakeController =
      Get.put(EarthquakeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        titleTextStyle: TextStyle(
                            fontFamily: 'VarelaRound',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        descTextStyle: TextStyle(
                          fontFamily: 'VarelaRound',
                        ),
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.rightSlide,
                        title: 'Tips and Tricks',
                        desc: 'lorem ipsum',
                        btnOkOnPress: () {},
                      )..show();
                    },
                    icon: Icon(
                      Icons.info_outline,
                      size: 20,
                    ))
              ],
              title: Text(
                'Latest Earthquakes',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 15,
                ),
              ),
              centerTitle: true,
              toolbarHeight: 40,
              backgroundColor: kMainColor,
              leading: IconButton(
                onPressed: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                icon: Icon(Icons.menu),
              ),
            ),
            Container(
              height: Get.height,
              child: Obx(
                () => RefreshIndicator(
                  onRefresh: () {
                    return _earthquakeController.apiCall();
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _earthquakeController.earthquakes.length,
                    itemBuilder: (context, index) {
                      DateTime parsedDate = DateTime.parse(_earthquakeController
                          .earthquakes[index]["date"]
                          .replaceAll('.', '-'));
                      DateTime parsedDateTime =
                          DateTime.parse(parsedDate.toString());

                      String formattedTime =
                          DateFormat('HH:mm').format(parsedDateTime);
                      return _earthquakeController.earthquakes[index]["mag"] >
                              1.9
                          ? DepremKart(
                              closestAirports:
                                  _earthquakeController.earthquakes[index]
                                      ["location_properties"]["airports"],
                              closestCities:
                                  _earthquakeController.earthquakes[index]
                                      ["location_properties"]["closestCities"],
                              long: _earthquakeController.earthquakes[index]
                                  ["geojson"]["coordinates"][1],
                              lat: _earthquakeController.earthquakes[index]
                                  ["geojson"]["coordinates"][0],
                              sehir: _earthquakeController.earthquakes[index]
                                  ["title"],
                              buyukluk: _earthquakeController.earthquakes[index]
                                      ["mag"]
                                  .toString(),
                              derinlik: _earthquakeController.earthquakes[index]
                                      ["depth"]
                                  .toString(),
                              renk: _earthquakeController.changeColor(
                                _earthquakeController.earthquakes[index]["mag"],
                              ),
                              zaman: formattedTime,
                            )
                          : Container();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
