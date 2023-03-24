import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deprem/constants/constants.dart';
import 'package:deprem/controller/auth_controller.dart';
import 'package:deprem/widgets/emergency_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final AuthController _authController = Get.put(AuthController());

class EarthquakeDetails extends StatelessWidget {
  late GoogleMapController mapController;
  late double lat;
  late double long;
  EarthquakeDetails({required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(
          children: [
            GoogleMap(
              markers: {
                Marker(
                  markerId: const MarkerId("location1"),
                  position: LatLng(long, lat),
                  draggable: false,
                ),
              },
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(long, lat),
                zoom: 12.151926040649414,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HelpButton(),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class HelpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kMainColor,
      ),
      height: 40,
      child: TextButton(
        onPressed: () {
          _authController.helpInfo.clear();
          showDialog(
              context: context,
              builder: ((context) {
                return AlertDialog(
                  title: Text(
                    'Do You Need Help ?',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        width: Get.width,
                        height: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.twitter,
                                    color: Colors.lightBlue,
                                    size: 16,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '@emrecannerr',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'VarelaRound',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => Text(
                                  '#Help #Emergency #Earthquake \n\n' +
                                      _authController.helpInfo.value
                                          .toString() +
                                      '\n\n' +
                                      _authController.currentUserAddress.value,
                                  style: TextStyle(fontFamily: 'VarelaRound'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 200,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Tweet',
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      EmergencyButtons(
                        onPressed: () {
                          _authController.helpInfo
                              .add(_authController.needRescuers.value);
                        },
                        text: 'We need rescuers',
                        iconData: Icons.emoji_people,
                      ),
                      EmergencyButtons(
                        onPressed: () {
                          _authController.helpInfo
                              .add(_authController.needFood.value);
                        },
                        text: 'We need food',
                        iconData: Icons.food_bank,
                      ),
                      EmergencyButtons(
                        onPressed: () {
                          _authController.helpInfo
                              .add(_authController.needTent.value);
                        },
                        text: 'We need tent',
                        iconData: Icons.emergency,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Get.snackbar(
                                'Thanks for Feedback',
                                'If you need help around your location you can get help from Bi\'Destek Page',
                                duration: Duration(
                                  seconds: 10,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text(
                              'I\'m Fine',
                              style: TextStyle(
                                  fontFamily: 'VarelaRound',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }));
        },
        child: Text(
          'I Felt that Earthquake',
          style: TextStyle(fontFamily: 'VarelaRound', color: Colors.white),
        ),
      ),
    );
  }
}
