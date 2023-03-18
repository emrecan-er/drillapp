import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWaveClipper extends StatelessWidget {
  const MyWaveClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Opacity(
            opacity: 0.5,
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: kMainColor,
                height: 120,
              ),
            ),
          ),
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: kMainColor,
              height: 110,
              width: Get.width,
            ),
          ),
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(Get.width.toString());
    Path path = Path();
    path.lineTo(0, size.height);

    path.quadraticBezierTo(
        size.width / 5, size.height, size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(size.width - (size.width / 3.24), size.height - 105,
        size.width, size.height - 10);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
