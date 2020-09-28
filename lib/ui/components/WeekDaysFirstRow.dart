import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekDaysFirstRow extends StatelessWidget {
  List<String> get _weekNameList {
    DateFormat date = DateFormat.yMMM(Platform.localeName);
    List<String> weekNameList = List();

    for (int i = 1; i < 8; i++) {
      weekNameList.add(date.dateSymbols.STANDALONESHORTWEEKDAYS[i == 7 ? 0 : i]);
    }

    return weekNameList;
  }

  List<Widget> get _createWeekRowElements {
    List<String> nameList = List.from(_weekNameList);
    List<Widget> elementList = List();

    for (int i = 0; i < 7; i++) {
      elementList.add(Expanded(
        child: Text(
          nameList[i],
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ));
    }
    return elementList;

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _createWeekRowElements,
    );
  }

  TextStyle get textStyle => TextStyle(fontFamily: "playfair-regular", fontSize: 14.2, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black45);
}
