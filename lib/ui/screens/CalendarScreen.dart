import 'package:flutter/material.dart';

import 'WeekDaysFirstRow.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime now;

  DateTime startDate;
  DateTime lastDate;

  @override
  void initState() {
    now = DateTime.now();

    startDate = DateTime(now.year, now.month, now.day);
    lastDate = now.add(Duration(days: 180));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih Seçin"),
      ),
      body: Container(
        color: Colors.pink,
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            WeekDaysFirstRow(),
            Row(children: <Widget>[
              _fullDay(startDate),
              _fullDay(startDate),
              _fullDay(startDate),
              _fullDay(startDate),
              _fullDay(startDate),
              _fullDay(startDate),
              _fullDay(startDate),
            ],)
          ],
        ),
      ),
    );
  }
}

Widget _fullDay(DateTime dateDay) {
  return Expanded(child: Text(dateDay.day.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white)));
}
