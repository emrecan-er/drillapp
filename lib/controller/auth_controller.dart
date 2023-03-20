import 'package:get/get.dart';

class AuthController extends GetxController {
  var registerEmail = ''.obs;
  var registerPassword = ''.obs;
  var registerAge = ''.obs;
  var registerName = ''.obs;
  var registerAddress = ''.obs;
  var acceptedTerms = false.obs;
  var loginEmail = ''.obs;
  var loginPassword = ''.obs;
  var loggedInUserUid = ''.obs;
  var registerSurname = ''.obs;
  var currentUserAddress = ''.obs;
}
