import 'package:deprem/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Column(
                      children: [
                        ListTile(
                          title: const Text('Lafayette'),
                          leading: Radio<String>(
                            value: 'String',
                            groupValue: '_character',
                            onChanged: (String? value) {},
                          ),
                        ),
                        ListTile(
                          title: const Text('Lafayette'),
                          leading: Radio<String>(
                            value: 'String',
                            groupValue: '_character',
                            onChanged: (String? value) {},
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          bottom: const TabBar(
            indicatorColor: kbackgroundColor,
            tabs: [
              Tab(
                text: 'Available Jobs',
              ),
              Tab(
                text: 'I Need Job',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
