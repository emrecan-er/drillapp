import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Spacer(),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: kMainColor, width: 10),
              borderRadius: BorderRadius.circular(360),
              color: kbackgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/duduk.svg",
                  width: 75,
                  height: 75,
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kMainColor,
                ),
                onPressed: () async {},
                child: Text('Enkaz Altındayım !'),
              )
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '*Düdüğe tıklamanız halinde yüksek frekanslı düdük sesi çalacaktır.',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '**Enkaz Altındayım butonuna tıkladığınızda konum bilgileriniz Twitter araclığıyla paylaşılacaktır.Sahte kullanım cezaya tabi tutulacaktır.',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
