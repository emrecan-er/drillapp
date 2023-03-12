import 'package:deprem/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Welcome Emrecan',
              style: TextStyle(
                color: kMainColor,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 40,
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
            onTap: () {},
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
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kMainColor,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: kMainColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Logout',
                        style: TextStyle(
                          color: kMainColor,
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
            color: kMainColor,
          ),
        ),
        onTap: onTap,
        leading: Icon(
          icon,
          color: kMainColor,
        ),
      ),
    );
  }
}
