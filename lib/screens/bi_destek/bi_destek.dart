import 'package:deprem/constants/constants.dart';
import 'package:deprem/screens/bi_destek/donation.dart';
import 'package:deprem/screens/bi_destek/jobs.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BiDestek extends StatelessWidget {
  const BiDestek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        child: SpeedDial(
          child: Text(
            'Donations',
            style: TextStyle(
                fontFamily: 'VarelaRound', fontSize: 9, color: Colors.white),
          ),
          speedDialChildren: <SpeedDialChild>[
            SpeedDialChild(
              child: FaIcon(
                FontAwesomeIcons.moneyBill,
                size: 16,
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.greenAccent,
              label: 'AHBAP',
              onPressed: () {
                Get.to(
                  Donation(url: 'https://ahbap.org/bagisci-ol'),
                );
              },
            ),
            SpeedDialChild(
              child: FaIcon(
                FontAwesomeIcons.moneyBill,
                size: 16,
              ),
              foregroundColor: Colors.white,
              backgroundColor: Colors.orange,
              label: 'AFAD',
              onPressed: () {
                Get.to(
                  Donation(url: 'https://www.afad.gov.tr/depremkampanyasi2'),
                );
              },
            ),
          ],
          closedForegroundColor: kMainColor,
          openForegroundColor: Colors.green,
          closedBackgroundColor: kMainColor,
          openBackgroundColor: Colors.green,
        ),
      ),
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Bi\'Destek',
          style: TextStyle(
            fontFamily: 'VarelaRound',
            fontSize: 16,
          ),
        ),
        backgroundColor: kMainColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'What do you want help with?',
              style: TextStyle(
                fontFamily: 'VarelaRound',
                fontSize: 20,
              ),
            ),
          ),
          Row(
            children: [
              BiDestekCard(
                onPressed: () {
                  Get.to(Jobs());
                },
                iconData: FontAwesomeIcons.bagShopping,
                text: 'Jobs',
              ),
              BiDestekCard(
                onPressed: () {},
                iconData: FontAwesomeIcons.house,
                text: 'House',
              ),
            ],
          ),
          Row(
            children: [
              BiDestekCard(
                onPressed: () {},
                iconData: FontAwesomeIcons.turkishLiraSign,
                text: 'Money',
              ),
              BiDestekCard(
                onPressed: () {},
                iconData: FontAwesomeIcons.peopleLine,
                text: 'Law',
              ),
            ],
          ),
          Row(
            children: [
              BiDestekCard(
                onPressed: () {},
                iconData: Icons.help_center,
                text: 'Help Organizations',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BiDestekCard extends StatelessWidget {
  late IconData iconData;
  late String text;
  Function() onPressed;
  BiDestekCard(
      {required this.iconData, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Spacer(),
                FaIcon(
                  iconData,
                  color: Colors.black54,
                  size: 30,
                ),
                Spacer(),
                Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
