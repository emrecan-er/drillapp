import 'package:flutter/material.dart';

import '../constants/constants.dart';

class KitWidget extends StatelessWidget {
  late bool isChecked;
  late String title;
  void Function(bool?)? onChanged;
  KitWidget({
    required this.isChecked,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(
            width: 2,
            color: kMainColor,
          ),
          value: isChecked,
          onChanged: onChanged,
          activeColor: Colors.red,
        ),
        Text(
          title,
          style: TextStyle(fontFamily: 'VarelaRound', fontSize: 16),
        ),
      ],
    );
  }
}
