import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:deprem/constants/constants.dart';
import 'package:deprem/controller/auth_controller.dart';
import 'package:deprem/widgets/emergency_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final AuthController _authController = Get.put(AuthController());

class EarthquakeDetails extends StatelessWidget {
  final String mapUrl =
      "https://www.google.com/maps/d/embed?mid=1mYwVJPDiasVkOpCo4qU0g5JvmANgaEM";
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kMainColor,
      ),
      height: 40,
      child: TextButton(
          onPressed: () {
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
                        EmergencyButtons(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: Get.width,
                                    height: Get.height,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Your Address : ',
                                            style: TextStyle(
                                              fontFamily: 'VarelaRound',
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            _authController
                                                .currentUserAddress.value,
                                            style: TextStyle(
                                              fontFamily: 'VarelaRound',
                                              color: Colors.black,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.green,
                                                child: IconButton(
                                                  color: Colors.greenAccent,
                                                  highlightColor:
                                                      Colors.greenAccent, //
                                                  onPressed: () {
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType:
                                                          DialogType.success,
                                                      animType:
                                                          AnimType.rightSlide,
                                                      headerAnimationLoop:
                                                          false,
                                                      title: 'Done',
                                                      desc:
                                                          'Your address shared with authorities',
                                                      btnOkOnPress: () {},
                                                      btnOkIcon: Icons.done,
                                                      btnOkColor: Colors.green,
                                                    ).show();
                                                  },
                                                  icon: Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.red,
                                                child: IconButton(
                                                  color: Colors.redAccent,
                                                  highlightColor:
                                                      Colors.redAccent, //
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  );
                                });
                          },
                          text: 'I Need House',
                          iconData: Icons.house,
                        ),
                        EmergencyButtons(
                          onPressed: () {},
                          text: 'I Need Food',
                          iconData: Icons.food_bank,
                        ),
                        EmergencyButtons(
                          onPressed: () {},
                          text: 'I Need Tent',
                          iconData: Icons.emergency,
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            width: 200,
                            height: 50,
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
                                  colorText: Colors.white,
                                  backgroundColor: kMainColor,
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
                        )
                      ],
                    ),
                  );
                }));
          },
          child: Text(
            'I Felt that Earthquake',
            style: TextStyle(fontFamily: 'VarelaRound', color: Colors.white),
          )),
    );
  }
}
