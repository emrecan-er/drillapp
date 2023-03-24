import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HelpOrganizations extends StatelessWidget {
  const HelpOrganizations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: WebView(
        initialUrl:
            'https://www.google.com/maps/d/u/0/viewer?mid=1mYwVJPDiasVkOpCo4qU0g5JvmANgaEM&ll=37.41375621117184%2C37.25554324512946&z=8',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
