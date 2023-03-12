import 'dart:async';

import 'package:deprem/screens/home_page.dart';
import 'package:deprem/screens/main_screen.dart';
import 'package:deprem/screens/register_page.dart';
import 'package:deprem/screens/wave_clipper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(),
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
                    Get.to(
                      HomePage(),
                    );
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(
          fontFamily: 'VarelaRound',
          fontSize: 13,
        ),
      ),
    );
  }
}
