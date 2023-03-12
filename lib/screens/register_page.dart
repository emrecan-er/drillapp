import 'package:deprem/screens/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.exclamation,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.exclamation,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        FaIcon(
                          FontAwesomeIcons.exclamation,
                          color: Colors.black,
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'We will ask for your full name and address to share with Twitter and authorized institutions in case of a disaster. Your personal information that you share with us will be protected within the framework of the Personal Data Protection Law. There will be no violation of rights. Please make sure to enter your address information correctly, especially.',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                )
              ]),
              height: 200,
              color: Colors.red.withOpacity(0.5),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Personal Info',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Name :',
                          style: TextStyle(
                              fontFamily: 'VarelaRound', fontSize: 14),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: Get.width / 1.4,
                          child: CustomTextField(),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Surname :',
                          style: TextStyle(
                              fontFamily: 'VarelaRound', fontSize: 14),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: Get.width / 1.5,
                          child: CustomTextField(),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Adress :',
                          style: TextStyle(
                              fontFamily: 'VarelaRound', fontSize: 14),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: Get.width / 1.4,
                          child: CustomTextField(),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Mail :',
                          style: TextStyle(
                              fontFamily: 'VarelaRound', fontSize: 14),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: Get.width / 1.4,
                          child: CustomTextField(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      text: 'I have read and accept the ',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'VarelaRound',
                          fontSize: 13),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms',
                            style: TextStyle(
                                color: Colors.red,
                                fontFamily: 'VarelaRound',
                                fontSize: 13),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // navigate to desired screen
                              }),
                      ],
                    ),
                  ),
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Colors.red,
                ),
              ],
            ),
            Center(
              child: NiceButtons(
                startColor: Colors.red,
                endColor: Colors.red.withOpacity(0.7),
                borderColor: Colors.red.withOpacity(0.5),
                height: 40,
                stretch: false,
                borderRadius: 30,
                gradientOrientation: GradientOrientation.Horizontal,
                onTap: (finish) {
                  print('On tap called');
                },
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
