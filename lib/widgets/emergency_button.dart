import 'package:flutter/material.dart';

class EmergencyButtons extends StatelessWidget {
  late IconData iconData;
  late String text;
  Function() onPressed;
  EmergencyButtons({
    required this.iconData,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black54,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.black54, fontFamily: 'VarelaRound'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
