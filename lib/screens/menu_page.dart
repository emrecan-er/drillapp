import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deprem/constants/constants.dart';
import 'package:deprem/screens/bi_destek/bi_destek.dart';
import 'package:deprem/screens/menu_screens/building_inspection.dart';
import 'package:deprem/screens/menu_screens/drill.dart';
import 'package:deprem/screens/menu_screens/survival_kit.dart';
import 'package:deprem/service/api/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class MenuPage extends StatelessWidget {
  AuthService _authService = AuthService();
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor.withOpacity(0.95),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream:
                  _authService.getUser(_authController.loggedInUserUid.value),
              builder: (context, snapshot) {
                return !snapshot.hasData
                    ? CircularProgressIndicator()
                    : Container(
                        height: 100,
                        width: Get.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot documentSnapshot =
                                  snapshot.data!.docs[index];
                              _authController.currentUserAddress.value =
                                  documentSnapshot['address'];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Have a nice day',
                                            style: TextStyle(
                                              fontFamily: 'VarelaRound',
                                              color: Colors.white54,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Welcome ' + documentSnapshot['name'],
                                          style: TextStyle(
                                            fontFamily: 'VarelaRound',
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
              },
            ),
          ),
          DrawerTile(
            text: 'Bi\'Destek',
            onTap: () {
              Get.to(BiDestek());
            },
            icon: Icons.help_outline_outlined,
          ),
          DrawerTile(
            text: 'News',
            onTap: () {},
            icon: Icons.newspaper,
          ),
          DrawerTile(
            text: 'Survival Kit',
            onTap: () {
              Get.to(SurvivalKit());
            },
            icon: FontAwesomeIcons.lifeRing,
          ),
          DrawerTile(
            text: 'Drill',
            onTap: () {
              Get.to(Drill());
            },
            icon: FontAwesomeIcons.personRunning,
          ),
          DrawerTile(
            text: 'Building Inspection',
            onTap: () {
              Get.to(BuildingInspection());
            },
            icon: FontAwesomeIcons.houseCrack,
          ),
          DrawerTile(
            text: 'Settings',
            onTap: () {},
            icon: FontAwesomeIcons.gear,
          ),
          Spacer(),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kbackgroundColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: kbackgroundColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: kbackgroundColor,
                              fontFamily: 'VarelaRound',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 175,
              ),
              Text(
                'drill app',
                style: TextStyle(
                  letterSpacing: 2,
                  color: kbackgroundColor,
                  fontFamily: 'AdriaGrotesk',
                  fontSize: 17,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  String text;
  IconData icon;
  Function() onTap;
  DrawerTile({required this.icon, required this.onTap, required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width / 1.5,
      height: 50,
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontFamily: 'VarelaRound',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
