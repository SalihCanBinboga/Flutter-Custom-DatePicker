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
      body: Container(
          margin: EdgeInsets.only(top: 16),
          color: Colors.pink,
          height: MediaQuery.of(context).size.height * .9,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 8),
                child: CalendarWidget(
                  startDate: DateTime.now(),
                ),
              );
            },
            itemCount: 10,
          )),
    );
  }
}
