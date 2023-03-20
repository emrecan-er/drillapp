import 'package:deprem/constants/constants.dart';
import 'package:deprem/screens/securing_furniture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class LifeTriangle extends StatelessWidget {
  const LifeTriangle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Life Triange',
          style: TextStyle(
            fontFamily: 'VarelaRound',
            fontSize: 15,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 40,
        backgroundColor: kMainColor,
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Find Safe Place',
                    style: TextStyle(
                        fontFamily: 'VarelaRound',
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Please select your current location below                                        ',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.house_outlined,
                        color: Colors.black54,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: kMainColor,
                            value: true,
                            onChanged: (value) {},
                          ),
                          Text(
                            'House',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.work_outline,
                        color: Colors.black54,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: kMainColor,
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text(
                            'Office',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.school_outlined,
                        color: Colors.black54,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          Text(
                            'School',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Upload Image',
                    style: TextStyle(
                        fontFamily: 'VarelaRound',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Upload the image of your current room.We will analyze for life triangles.You can see the results below.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width,
                height: 200,
                child: Image.asset('assets/upload.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: Text(
                'Click Image to Upload',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Your Result',
                    style: TextStyle(
                      fontFamily: 'VarelaRound',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: kMainColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: Get.width,
                height: 300,
                child: Image.asset(
                  'assets/bedroom.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'The risky and safe areas in your rooms are shown approximately. If you want to make your room more secure, you can read the article below.',
                style: TextStyle(
                  fontFamily: 'VarelaRound',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(Securing());
                },
                child: Container(
                  width: Get.width,
                  height: 180,
                  decoration: BoxDecoration(
                    color: kMainColor,
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff833ab4).withOpacity(0.5),
                        Color(0xfffd1d1d).withOpacity(0.5),
                        Color(0xfffcb045).withOpacity(0.5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'The importance of securing furniture before an earthquake.',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Click and Read',
                            style: TextStyle(
                              fontFamily: 'VarelaRound',
                              color: Colors.white54,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset('assets/furniture.png'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
