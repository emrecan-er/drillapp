import 'package:deprem/constants.dart';
import 'package:deprem/screens/main_screen.dart';
import 'package:deprem/slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:slide_to_act/slide_to_act.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  int _currentPage = 0;
  PageController _controller = PageController();
  final GlobalKey<SlideActionState> _key = GlobalKey();

  // ignore: prefer_final_fields
  List<Widget> _pages = [
    SliderPage(
      description:
          'buralara bir şeyler yazılacak aaaa aaaaa aaaaaa \n aaaa aaaaaa aaa aaaaa',
      image: "assets/1.png",
      title: 'Depremden Önce',
    ),
    SliderPage(
      description:
          'buralara bir şeyler yazılacak aaaa aaaaa aaaaaa \n aaaa aaaaaa aaa aaaaa',
      image: "assets/2.png",
      title: 'Deprem Sırasında',
    ),
    SliderPage(
      description:
          'buralara bir şeyler yazılacak aaaa aaaaa aaaaaa \n aaaa aaaaaa aaa aaaaa',
      image: "assets/3.png",
      title: 'Depremden Sonrası',
    ),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        body: Stack(
          children: <Widget>[
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onchanged,
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                    _pages.length,
                    (int index) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 5,
                        width: (index == _currentPage) ? 20 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: (index == _currentPage)
                              ? kMainColor
                              : kMainColor.withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
                Container(
                  child: (_currentPage == (_pages.length - 1))
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 64, right: 32, left: 32),
                          child: SlideAction(
                            animationDuration: Duration(milliseconds: 500),
                            submittedIcon: Icon(
                              FontAwesomeIcons.heartPulse,
                              color: Colors.white,
                            ),
                            text: 'Başlayalım',
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'VarelaRound',
                              fontSize: 20,
                            ),
                            elevation: 1,
                            sliderButtonIcon: Icon(
                              Icons.arrow_forward,
                              size: 24,
                              color: kMainColor,
                            ),
                            sliderButtonIconPadding: 10,
                            outerColor: kMainColor.withOpacity(0.8),
                            sliderButtonIconSize: 14,
                            height: Get.height / 12,
                            key: _key,
                            onSubmit: () {
                              Get.off(MainScreen());
                            },
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.navigate_next,
                            size: 50,
                            color: kMainColor.withOpacity(0.5),
                          ),
                          onPressed: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 800),
                                curve: Curves.easeInOutQuint);
                          },
                        ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
