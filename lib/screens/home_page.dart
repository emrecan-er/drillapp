import 'package:deprem/screens/main_screen.dart';
import 'package:deprem/screens/menu_page.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        menuScreenWidth: Get.width,
        angle: -12,
        mainScreenScale: 0.2,
        menuScreen: MenuPage(),
        mainScreen: MainScreen(),
      );
}
