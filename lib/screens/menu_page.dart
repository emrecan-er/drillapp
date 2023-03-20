import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deprem/constants/constants.dart';
import 'package:deprem/screens/bi_destek/bi_destek.dart';
import 'package:deprem/screens/building_inspection.dart';
import 'package:deprem/service/api/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class MenuPage extends StatelessWidget {
  AuthService _authService = AuthService();
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor.withOpacity(0.9),
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
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome ' + documentSnapshot['name'],
                                    style: TextStyle(
                                      fontFamily: 'VarelaRound',
                                      color: kbackgroundColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
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
            icon: Icons.help,
          ),
          DrawerTile(
            text: 'News',
            onTap: () {},
            icon: Icons.newspaper,
          ),
          DrawerTile(
            text: 'Life Triangle',
            onTap: () {},
            icon: Icons.healing,
          ),
          DrawerTile(
            text: 'Building Inspection',
            onTap: () {
              Get.to(BuildingInspection());
            },
            icon: Icons.house,
          ),
          DrawerTile(
            text: 'Settings',
            onTap: () {},
            icon: Icons.settings,
          ),
          Spacer(),
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
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
            color: kbackgroundColor,
          ),
        ),
        onTap: onTap,
        leading: Icon(
          icon,
          color: kbackgroundColor,
        ),
      ),
    );
  }
}
