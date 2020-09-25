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


    List<Widget> dayRows = [];
    dayRows.add(WeekDaysFirstRow());


    return Scaffold(
      appBar: AppBar(
        title: Text("Tarih Seçin"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 16),
        color: Colors.pink,
        height: MediaQuery.of(context).size.height * .9,
        width: MediaQuery.of(context).size.width,
        child: Column(children: dayRows),
      ),
    );
  }
}

Widget _fullDay(DateTime dateDay) => Expanded(child: Text(dateDay.day.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white)));

Widget get _emptyDay => Expanded(child: Text("boş", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)));
