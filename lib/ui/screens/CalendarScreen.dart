import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CalendarWidget.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih Seçin"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 16),
            child: CalendarWidget(
              startDate: getDateByPosition(index),
            ),
          );
        },
        itemCount: getTotalMonth,
      ),
    );
  }

  DateTime getDateByPosition(int monthIndex) {
    DateTime startDate = DateTime.now();

    if (monthIndex != 0) {
      startDate = startDate.add(Duration(days: ((monthIndex) * 30)));
    }

    return startDate;
  }

  int get getTotalMonth {
    var addFiveMonthAtNow = DateTime.now().add(Duration(days: 150));
    var calculatedYear = addFiveMonthAtNow.year - DateTime.now().year;
    var calculatedMonthCount = 12 * calculatedYear;
    return calculatedMonthCount + addFiveMonthAtNow.month - DateTime.now().month;
  }

}
