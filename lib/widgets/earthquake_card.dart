import 'package:deprem/screens/earthquake_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/constants.dart';
import '../service/api/earthquake_controller.dart';

class DepremKart extends StatelessWidget {
  late String sehir;
  late String zaman;
  late String derinlik;
  late String buyukluk;
  late Color renk;
  late List closestCities;
  late List closestAirports;
  var lat;
  var long;
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
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 8),
      child: GestureDetector(
        onTap: () {
          _earthquakeController.closestAirports.clear();
          Get.to(EarthquakeDetails(
            lat: lat,
            long: long,
          ));
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
                            width: 5,
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
