import 'package:flutter/material.dart';

class WeekDaysFirstRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text("Pzt", textAlign: TextAlign.center, style: textStyle)),
        Expanded(child: Text("Salı", textAlign: TextAlign.center, style: textStyle)),
        Expanded(child: Text("Çrş", textAlign: TextAlign.center, style: textStyle)),
        Expanded(child: Text("Prş", textAlign: TextAlign.center, style: textStyle)),
        Expanded(child: Text("Cuma", textAlign: TextAlign.center, style: textStyle)),
        Expanded(child: Text("Cmts", textAlign: TextAlign.center, style: textStyle)),
        Expanded(child: Text("Pazar", textAlign: TextAlign.center, style: textStyle)),
      ],
    );
  }

  TextStyle get textStyle => TextStyle(fontFamily: "playfair-regular", fontSize: 14.2, fontWeight: FontWeight.w600, letterSpacing: 1, color: Colors.black45);
}
