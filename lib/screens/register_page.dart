import 'package:deprem/constants/constants.dart';
import 'package:deprem/controller/auth_controller.dart';
import 'package:deprem/service/api/auth_service.dart';
import 'package:deprem/widgets/custom_form_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nice_buttons/nice_buttons.dart';

class RegisterPage extends StatelessWidget {
  final AuthController _authController = Get.put(AuthController());
  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
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
            CustomFormField(
              lines: 1,
              type: TextInputType.name,
              icon: Icons.person,
              hint: 'Name',
              obscureText: false,
              onChanged: (input) {
                _authController.registerName.value = input;
              },
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.person,
              hint: 'Surname',
              obscureText: false,
              onChanged: (input) {
                _authController.registerSurname.value = input;
              },
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.number,
              icon: Icons.numbers,
              hint: 'Age',
              obscureText: false,
              onChanged: (input) {
                _authController.registerAge.value = input;
              },
            ),
            CustomFormField(
              lines: 3,
              type: TextInputType.name,
              icon: Icons.home,
              hint: '\nAddress',
              obscureText: false,
              onChanged: (input) {
                _authController.registerAddress.value = input;
              },
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.mail,
              hint: 'E-Mail Address',
              obscureText: false,
              onChanged: (input) {
                _authController.registerEmail.value = input;
              },
            ),
            CustomFormField(
              lines: 1,
              type: TextInputType.emailAddress,
              icon: Icons.mail,
              hint: 'Password',
              obscureText: true,
              onChanged: (input) {
                _authController.registerPassword.value = input;
              },
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
                                print('asd');
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return AlertDialog(
                                        title: Text('Legal Consent'),
                                        content: Column(
                                          children: [
                                            Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rhoncus, orci id lobortis auctor, ante magna semper odio, sed pulvinar nisi turpis eget sem. Morbi porttitor aliquam metus, ut feugiat ipsum aliquet vitae. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam pretium justo vitae lorem dictum, ut feugiat mi convallis. Mauris dui nisi, imperdiet vel odio id, porttitor mattis justo. Duis dapibus lorem enim. Donec placerat, enim nec pulvinar faucibus, dui ex suscipit dui, id consectetur eros orci id mauris. Nulla ac tincidunt magna, vel egestas tortor. Suspendisse dictum mauris id consequat feugiat. Aenean eu libero sit amet risus facilisis ultricies. Aenean dictum ex mauris, vitae congue magna sagittis sed. Integer sodales auctor molestie. Aliquam non eros nisi. Ut accumsan id ante id finibus.'),
                                          ],
                                        ),
                                      );
                                    }));
                              }),
                      ],
                    ),
                  ),
                ),
                Obx(
                  () => Checkbox(
                    side: BorderSide(
                      width: 2,
                      color: kMainColor,
                    ),
                    value: _authController.acceptedTerms.value,
                    onChanged: (value) {
                      _authController.acceptedTerms.value = value!;
                    },
                    activeColor: Colors.red,
                  ),
                )
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
                  if (_authController.acceptedTerms.value == true) {
                    _authService.createPerson(
                      _authController.registerEmail.value,
                      _authController.registerPassword.value,
                      _authController.registerName.value,
                      _authController.registerSurname.value,
                      _authController.registerAge.value,
                      _authController.registerAddress.value,
                      _authController.acceptedTerms.value,
                    );
                    Navigator.pop(context);
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please Accept the Terms',
                    );
                  }
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

  TextStyle RegisterStyle() {
    return TextStyle(
        fontFamily: 'VarelaRound',
        fontSize: 12,
        color: kMainColor.withOpacity(0.5));
  }
}
