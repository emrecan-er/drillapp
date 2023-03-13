import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:deprem/service/api/earthquake_data.dart';
import 'package:get/get.dart';

class EarthquakeController extends GetxController {
  var earthquakes = [].obs;
  var cardColor = Colors.red.obs;
  var closestAirports = [].obs;
  var closestCities = [].obs;
  apiCall() async {
    final response = await http.get(
      Uri.parse('https://api.orhanaydogdu.com.tr/deprem/kandilli/live'),
    );
    Map data = jsonDecode(response.body);
    earthquakes.value = data['result'];
    inspect(earthquakes.value);

    return EarthquakeData.fromJson(json.decode(response.body));
  }

  MaterialColor changeColor(var mag) {
    if (mag >= 0 && mag < 3) {
      return Colors.green;
    } else if (mag >= 3 && mag < 5.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
