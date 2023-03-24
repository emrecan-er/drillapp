import 'package:flutter/material.dart';

class EmergencyButtons extends StatelessWidget {
  late IconData iconData;
  late String text;
  bool isClicked = false;
  Function() onPressed;
  EmergencyButtons({
    required this.iconData,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.black54,
              )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: Colors.black54,
                  size: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'VarelaRound',
                      fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
