import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';

class Securing extends StatelessWidget {
  const Securing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text(
                'Securing Furnitures',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 15,
                ),
              ),
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 40,
              backgroundColor: kMainColor,
            ),
            Container(
              width: Get.width,
              height: 400,
              color: Colors.amber,
              child: Image.asset(
                'assets/sec.png',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '3 min reading',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Securing Furnitures for Earthquakes',
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
                'Securing furniture before an earthquake is essential to reduce the risk of injury and damage to your property. The Kahramanmaras earthquake in Turkey in 2023 is a reminder of how important it is to secure heavy furniture items such as bookshelves, dressers, and cabinets to the wall. Inspect your furniture regularly and have an emergency plan in place. By taking these simple steps, you can protect yourself and your loved ones during an earthquake.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '1- Identify heavy furniture items that could fall and cause harm.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '2- Choose an appropriate anchoring system based on the type of furniture and the wall material.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '3- Install the anchoring system according to the manufacturer\'s instructions, ensuring that it is securely attached to the wall and the furniture.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '4- Regularly check the anchoring system to ensure that it is still securely attached and that the furniture has not shifted or become loose.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '5- Have an emergency plan in place for how to react during an earthquake and ensure that everyone in your household is aware of the plan.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
