import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Depremler extends StatelessWidget {
  const Depremler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              title: Text(
                'RescueMe',
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 30,
                child: TextField(
                  onChanged: (value) {},
                  cursorColor: kMainColor,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainColor),
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: kMainColor,
                    ),
                    label: Text('asdas'),
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontFamily: 'VarelaRound',
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            DepremKart(
              sehir: 'K.MARAS',
              zaman: '25/02/2023',
              derinlik: '12.8',
              buyukluk: '2.0',
              renk: Colors.green,
            ),
            DepremKart(
              sehir: 'K.MARAS',
              zaman: '25/02/2023',
              derinlik: '4.5',
              buyukluk: '4.6',
              renk: Colors.blue,
            ),
            DepremKart(
              sehir: 'ISTANBUL',
              zaman: '12/07/2023',
              derinlik: '7.4',
              buyukluk: '?',
              renk: Colors.red,
            ),
            DepremKart(
              sehir: 'HATAY',
              zaman: '25/02/2023',
              derinlik: '4.1',
              buyukluk: '2.1',
              renk: Colors.green,
            ),
            DepremKart(
              sehir: 'TEST',
              zaman: 'TEST',
              derinlik: 'TEST ',
              buyukluk: 'TEST',
              renk: Colors.red,
            ),
            DepremKart(
              sehir: 'TEST',
              zaman: '25/02/2023',
              derinlik: '12.8',
              buyukluk: '2.0',
              renk: Colors.blue,
            ),
            DepremKart(
              sehir: 'K.MARAS',
              zaman: '25/02/2023',
              derinlik: '12.8',
              buyukluk: '2.0',
              renk: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}

class DepremKart extends StatelessWidget {
  late String sehir;
  late String zaman;
  late String derinlik;
  late String buyukluk;
  late Color renk;
  DepremKart(
      {required this.sehir,
      required this.buyukluk,
      required this.derinlik,
      required this.renk,
      required this.zaman});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width,
                      child: Text(
                        'Maps Activity will be here',
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text('data'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          width: Get.width,
          height: Get.height / 8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: Get.height / 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: renk,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: Get.width - 40,
                          height: 80,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Şehir',
                                      style: headerStyle(),
                                    ),
                                    Spacer(),
                                    Text(
                                      sehir,
                                      style: infoStyle(),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Zaman',
                                      style: headerStyle(),
                                    ),
                                    Spacer(),
                                    Text(
                                      zaman,
                                      style: infoStyle(),
                                    ),
                                    Spacer(),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Derinlik',
                                      style: headerStyle(),
                                    ),
                                    Spacer(),
                                    Text(
                                      derinlik + 'km',
                                      style: infoStyle(),
                                    ),
                                    Spacer(),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Büyüklük',
                                      style: headerStyle(),
                                    ),
                                    Spacer(),
                                    Text(
                                      buyukluk,
                                      style: infoStyle(),
                                    ),
                                    Spacer(),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
