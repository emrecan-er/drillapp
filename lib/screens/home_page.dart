import 'package:deprem/screens/main_screen.dart';
import 'package:deprem/screens/menu_page.dart';
import 'package:deprem/service/api/earthquake_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

EarthquakeController _earthquakeController = Get.put(EarthquakeController());

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _earthquakeController.apiCall();
  }

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        menuScreenWidth: Get.width,
        angle: -12,
        mainScreenScale: 0.2,
        menuScreen: MenuPage(),
        mainScreen: MainScreen(),
      );
}
