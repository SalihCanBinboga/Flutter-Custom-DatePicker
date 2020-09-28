import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/CalendarWidget.dart';

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
      body: SafeArea(
        child: CalendarWidget(
          totalAddMonth: 15,
          onResultDate: (DateTime dateTime) {
            Navigator.of(context).pop(dateTime);
          },
        ),
      ),
    );
  }
}
