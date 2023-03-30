import 'package:audioplayers/audioplayers.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmergencyPage extends StatelessWidget {
  final twitterApi = TwitterApi(
    client: TwitterClient(
      consumerKey: 'KEY',
      consumerSecret: 'KEY',
      token: 'KEY-KEY',
      secret: 'KEY',
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
                  Get.snackbar('We Can\'t Detect an Earthquake Near You',
                      'The earthquake you felt should be at least 5.5 magnitude.');
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
              '*If you click a whistle it makes sound',
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
              '**When you click I Need Help button,your address will be tweeted automaticly.',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'VarelaRound',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
