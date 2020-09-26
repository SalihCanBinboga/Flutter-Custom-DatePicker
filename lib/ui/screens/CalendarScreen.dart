import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/CustomCalendar.dart';

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
      body: CustomCalendar(
        totalAddMonth: 15,
      ),
    );
  }
}

