import 'package:audioplayers/audioplayers.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

final player = AudioCache();

class EmergencyPage extends StatelessWidget {
  final twitterApi = TwitterApi(
    client: TwitterClient(
      consumerKey: 'qp9oYLSMZttmRXVdOfXLc764o',
      consumerSecret:
          'F4VuI0GQ44Dr0S8W8zkzF0qYRXc1zGsIgNCBMb6cEJ8B1ukPsD', //I removed them because this code is public on GitHub
      token: '1291398145583263752-gAIH4xXaej4UKjLVOsnZtrNYgtasDd',
      secret: 'UXHagLqFLOLzfRviSf85kUabBK0J4Hb7QchAWaUt3BV9P',
    ),
  );
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
                GestureDetector(
                  onTap: () async {},
                  child: SvgPicture.asset(
                    "assets/duduk.svg",
                    width: 75,
                    height: 75,
                  ),
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
                onPressed: () async {
                  Get.snackbar(
                    'This is working',
                    'Normally my tweet bot tweets but i removed it because i will share this code public on GitHub for examination.',
                    duration: Duration(seconds: 6),
                  );
                  try {
                    // Get the last 200 tweets from my home timeline
                    final homeTimeline =
                        await twitterApi.timelineService.homeTimeline(
                      count: 200,
                    );

                    homeTimeline.forEach((tweet) => print(tweet.fullText));
                  } catch (error) {
                    print('error while requesting home timeline: $error');
                  }
                },
                child: Text('I Need Help !'),
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
              '**Enkaz Altındayım butonuna tıkladığınızda konum bilgileriniz Twitter araclığıyla paylaşılacaktır.',
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
