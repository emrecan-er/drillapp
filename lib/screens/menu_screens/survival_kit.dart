import 'package:deprem/constants/constants.dart';
import 'package:deprem/controller/state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../widgets/kit_widget.dart';

class SurvivalKit extends StatelessWidget {
  StateController _stateController = Get.put(StateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbackgroundColor,
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  elevation: 0,
                  title: Text(
                    'Survival Kit',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontSize: 15,
                    ),
                  ),
                  centerTitle: true,
                  toolbarHeight: 40,
                  backgroundColor: kMainColor,
                ),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kMainColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  'Do you prepare your bag ?',
                                  style: TextStyle(
                                    fontFamily: 'VarelaRound',
                                    color: kbackgroundColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'It is vitally important to have a bag with vital items in it before a disaster.',
                            style: TextStyle(
                                fontFamily: 'VarelaRound',
                                color: kbackgroundColor.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Check the items below !',
                    style: TextStyle(
                        fontFamily: 'VarelaRound', color: Colors.black54),
                  ),
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.whistleCheckbox.value = value!;
                  },
                  title: 'Whistle',
                  isChecked: _stateController.whistleCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.flashlightCheckbox.value = value!;
                  },
                  title: 'Flashlight',
                  isChecked: _stateController.flashlightCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.paperCheckbox.value = value!;
                  },
                  title: 'Paper and Pencil',
                  isChecked: _stateController.paperCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.foodCheckbox.value = value!;
                  },
                  title: 'Water and Food',
                  isChecked: _stateController.foodCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.aidCheckbox.value = value!;
                  },
                  title: 'First Aid Kit',
                  isChecked: _stateController.aidCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.blanketCheckbox.value = value!;
                  },
                  title: 'Blanket',
                  isChecked: _stateController.blanketCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.radioCheckbox.value = value!;
                  },
                  title: 'Radio',
                  isChecked: _stateController.radioCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.clothesCheckbox.value = value!;
                  },
                  title: 'Clothes',
                  isChecked: _stateController.clothesCheckbox.value,
                ),
                KitWidget(
                  onChanged: (value) {
                    _stateController.powerbankCheckbox.value = value!;
                  },
                  title: 'Powerbank and USB Cable',
                  isChecked: _stateController.powerbankCheckbox.value,
                ),
              ],
            ),
          ),
        ));
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
