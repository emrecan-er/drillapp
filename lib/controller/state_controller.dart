import 'package:get/get.dart';

class StateController extends GetxController {
  var foodCheckbox = false.obs;
  var whistleCheckbox = false.obs;
  var paperCheckbox = false.obs;
  var flashlightCheckbox = false.obs;
  var aidCheckbox = false.obs;
  var blanketCheckbox = false.obs;
  var radioCheckbox = false.obs;
  var clothesCheckbox = false.obs;
  var powerbankCheckbox = false.obs;
  var selectedDate = ''.obs;
  var selectedTime = ''.obs;
  var scheduledDrills = [].obs;
  var heroTag = 'name'.obs;
}
