import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BuildingInspection extends StatelessWidget {
  const BuildingInspection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.amber,
              width: Get.width,
              height: 300,
              child: Image.asset(
                'assets/deprem.jpg',
                fit: BoxFit.fitHeight,
                scale: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Building Inspection for Earthquakes',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Earthquakes can happen anytime and anywhere, often with little or no warning. While we can\'t predict exactly when or where earthquakes will occur, we can take steps to prepare ourselves and our communities for when they do. One important step is to have our buildings inspected to ensure they are structurally sound and able to withstand the forces of an earthquake.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'On February 6th, 2023, a 7.5 and 7.7 magnitude earthquake hit Kahramanmaras, Turkey, causing significant damage to buildings and leaving many people without homes. Although not as devastating as some past earthquakes, this event serves as a reminder of the importance of being prepared.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Building inspections are a critical aspect of earthquake preparedness. These inspections can identify potential weaknesses in a building\'s structure and provide recommendations for improvements. Depending on the severity of the issues found, improvements can range from minor repairs to major structural upgrades.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Addressing these issues can help ensure that our buildings are better equipped to withstand earthquakes and protect their occupants. Additionally, inspections can have financial benefits, as buildings that have been inspected and deemed structurally sound may be more attractive to potential buyers or renters. Inspections can also identify issues before they become more severe, potentially saving building owners and occupants from costly repairs or reconstruction.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'It\'s important to emphasize that building inspections should be conducted by qualified professionals, such as licensed structural engineers or architects. These experts have the necessary training and expertise to identify potential issues and recommend appropriate improvements.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'In summary, building inspections play a crucial role in earthquake preparedness. By identifying and addressing potential weaknesses in our buildings, we can better protect ourselves and our communities from the potentially catastrophic effects of earthquakes. The recent earthquake in Turkey underscores the importance of prioritizing building inspections and taking steps to be better prepared for future earthquakes.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
