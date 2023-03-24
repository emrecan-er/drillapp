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
  var helpInfo = [].obs;
  var needRescuers = 'We need rescuers'.obs;
  var needFood = 'We need food'.obs;
  var needTent = 'We need tent'.obs;
}
