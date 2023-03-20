import 'dart:async';

import 'package:deprem/constants/constants.dart';
import 'package:deprem/screens/home_page.dart';
import 'package:deprem/screens/register_page.dart';
import 'package:deprem/widgets/custom_form_field.dart';
import 'package:deprem/widgets/wave_clipper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

import '../controller/auth_controller.dart';
import '../service/api/auth_service.dart';

class LoginPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyWaveClipper(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
              ),
              child: Row(
                children: [
                  Text(
                    'Hello,',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 24,
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                top: 8,
              ),
              child: Row(
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      fontFamily: 'VarelaRound',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CustomFormField(
                hint: 'Username',
                lines: 1,
                type: TextInputType.emailAddress,
                obscureText: false,
                onChanged: (input) {
                  _authController.loginEmail.value = input;
                },
                icon: FontAwesomeIcons.user),
            CustomFormField(
              hint: 'Password',
              lines: 1,
              type: TextInputType.name,
              obscureText: true,
              onChanged: (input) {
                _authController.loginPassword.value = input;
              },
              icon: Icons.password,
            ),
            SizedBox(
              height: 50,
            ),
            RichText(
              text: TextSpan(
                  text: 'Don\'t have an account?',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'VarelaRound',
                      fontSize: 13),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Sign up',
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'VarelaRound',
                            fontSize: 13),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(
                              RegisterPage(),
                            );
                            // navigate to desired screen
                          })
                  ]),
            ),
            SizedBox(
              height: 25,
            ),
            NiceButtons(
              height: 40,
              startColor: Colors.red,
              endColor: Colors.red.withOpacity(0.9),
              borderColor: Colors.red.withOpacity(0.5),
              stretch: false,
              progress: true,
              gradientOrientation: GradientOrientation.Horizontal,
              onTap: (finish) {
                print('On tap called');
                Timer(Duration(seconds: 2), () {
                  finish();
                  if (_authController.loginEmail.value == '' ||
                      _authController.loginPassword.value == '') {
                    Get.snackbar(
                      'Error',
                      'Make sure that enter your Email and Password',
                    );
                  } else {
                    _authService.signIn(_authController.loginEmail.value,
                        _authController.loginPassword.value);
                    Get.off(
                      HomePage(),
                    );
                  }
                });
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  late String hint;
  CustomTextField({required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.red,
      onChanged: (value) {},
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'VarelaRound',
          fontSize: 13,
        ),
      ),
    );
  }
}
