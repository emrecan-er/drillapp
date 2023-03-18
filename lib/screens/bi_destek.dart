import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BiDestek extends StatelessWidget {
  const BiDestek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: Colors.indigo,
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
                iconData: FontAwesomeIcons.bagShopping,
                text: 'Job',
              ),
              BiDestekCard(
                iconData: FontAwesomeIcons.house,
                text: 'House',
              ),
            ],
          ),
          Row(
            children: [
              BiDestekCard(
                iconData: FontAwesomeIcons.turkishLiraSign,
                text: 'Money',
              ),
              BiDestekCard(
                iconData: FontAwesomeIcons.peopleLine,
                text: 'Law',
              ),
            ],
          ),
          Row(
            children: [
              BiDestekCard(
                iconData: FontAwesomeIcons.earthEurope,
                text: 'Government',
              ),
              BiDestekCard(
                iconData: FontAwesomeIcons.userDoctor,
                text: 'Psychologist',
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
  BiDestekCard({required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.indigo,
            ),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Spacer(),
              FaIcon(
                iconData,
                color: Colors.indigo,
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
    );
  }
}
