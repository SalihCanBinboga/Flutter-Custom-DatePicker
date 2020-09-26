import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/CalendarWidget.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Tarih Seçin"),
      ),
      body: SafeArea(
        child: CalendarWidget(
          totalAddMonth: 15,
          onResultDate: (DateTime dateTime) {
            //Navigator.of(context).pop(dateTime);
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Seçilen Tarih: $dateTime"),
            ));
          },
        ),
      ),
    );
  }
}
