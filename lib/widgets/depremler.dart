import 'dart:developer';

import 'package:deprem/constants/constants.dart';
import 'package:deprem/service/api/earthquake_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

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
                'RescueMe',
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
                () => ListView.builder(
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
                      closestAirports: _earthquakeController.earthquakes[index]
                          ["location_properties"]["airports"],
                      closestCities: _earthquakeController.earthquakes[index]
                          ["location_properties"]["closestCities"],
                      long: _earthquakeController.earthquakes[index]["geojson"]
                          ["coordinates"][1],
                      lat: _earthquakeController.earthquakes[index]["geojson"]
                          ["coordinates"][0],
                      sehir: _earthquakeController.earthquakes[index]["title"],
                      buyukluk: _earthquakeController.earthquakes[index]["mag"]
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
          ],
        ),
      ),
    );
  }
}

class DepremKart extends StatelessWidget {
  late String sehir;
  late String zaman;
  late String derinlik;
  late String buyukluk;
  late Color renk;
  late List closestCities;
  late List closestAirports;
  double lat;
  double long;
  DepremKart({
    required this.closestAirports,
    required this.closestCities,
    required this.lat,
    required this.long,
    required this.sehir,
    required this.buyukluk,
    required this.derinlik,
    required this.renk,
    required this.zaman,
  });

  @override
  Widget build(BuildContext context) {
    EarthquakeController _earthquakeController =
        Get.put(EarthquakeController());

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: GestureDetector(
        onTap: () {
          inspect(closestAirports);
          _earthquakeController.closestAirports.clear();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      height: Get.height / 3,
                      color: Colors.white,
                      width: Get.width,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(long, lat),
                          zoom: 12.151926040649414,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Closest Cities',
                              style: headerStyle(),
                            ),
                            SizedBox(
                              height: 100,
                              width: 150,
                              child: ListView.builder(
                                itemCount: closestCities.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    '-' + closestCities[index]["name"],
                                    style: infoStyle(),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Closest Airports',
                              style: headerStyle(),
                            ),
                            SizedBox(
                              height: 100,
                              width: 150,
                              child: ListView.builder(
                                itemCount: closestAirports.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    '-' + closestAirports[index]["name"],
                                    style: infoStyle(),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          width: Get.width,
          height: Get.height / 5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            width: Get.width,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            width: 10,
                            height: Get.height / 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                              color: renk,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                sehir,
                                style: infoStyle().copyWith(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Depth',
                                    style: headerStyle(),
                                  ),
                                  Text(
                                    derinlik + ' km',
                                    style: infoStyle(),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Magnitude',
                                    style: headerStyle(),
                                  ),
                                  Text(
                                    buyukluk,
                                    style: infoStyle(),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Time',
                                    style: headerStyle(),
                                  ),
                                  Text(
                                    zaman,
                                    style: infoStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
