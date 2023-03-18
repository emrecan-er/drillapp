import 'package:deprem/constants/constants.dart';
import 'package:deprem/service/api/earthquake_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'earthquake_card.dart';

class Depremler extends StatelessWidget {
  EarthquakeController _earthquakeController = Get.put(EarthquakeController());

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
                      _earthquakeController.apiCall();
                    },
                    icon: Icon(
                      Icons.refresh,
                    ))
              ],
              title: Text(
                'Disaster',
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
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: SizedBox(
                height: 30,
                child: TextField(
                  onChanged: (value) {},
                  cursorColor: kMainColor,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: kMainColor,
                    ),
                    label: Text('Search'),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'VarelaRound',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 12,
                    color: Colors.grey,
                  ),
                  Text(
                    'Press the card for more information.',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
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
                    itemCount: _earthquakeController.earthquakes.length,
                    itemBuilder: (context, index) {
                      DateTime parsedDate = DateTime.parse(_earthquakeController
                          .earthquakes[index]["date"]
                          .replaceAll('.', '-'));
                      DateTime parsedDateTime =
                          DateTime.parse(parsedDate.toString());

                      String formattedTime =
                          DateFormat('HH:mm').format(parsedDateTime);
                      return DepremKart(
                        closestAirports:
                            _earthquakeController.earthquakes[index]
                                ["location_properties"]["airports"],
                        closestCities: _earthquakeController.earthquakes[index]
                            ["location_properties"]["closestCities"],
                        long: _earthquakeController.earthquakes[index]
                            ["geojson"]["coordinates"][1],
                        lat: _earthquakeController.earthquakes[index]["geojson"]
                            ["coordinates"][0],
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
                      );
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
