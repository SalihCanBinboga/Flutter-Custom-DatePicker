import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'CalendarScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Custom Calendar App"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarScreen())).then(
                  (dateTime) => {
                    if(dateTime != null){
                      _showDate(dateTime)
                    }
                  },
                )
          },
          color: Colors.blue,
          child: Text(
            "Takvimi Aç",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _showDate(DateTime dateTime) {
    var dateStandard = DateFormat("d.M.y",Platform.localeName).format(dateTime);
    var dateNamedMonth = DateFormat("d MMMM y",Platform.localeName).format(dateTime);
    var dateShortMonthDay = DateFormat("d MMM y EEEE",Platform.localeName).format(dateTime);
    var dateShortMonthShortDay = DateFormat("d MMM y E",Platform.localeName).format(dateTime);

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Gelen Tarih: $dateStandard"),
            Text("Gelen Tarih: $dateNamedMonth"),
            Text("Gelen Tarih: $dateShortMonthDay"),
            Text("Gelen Tarih: $dateShortMonthShortDay"),
          ],
        ),
      ),
    ));
  }
}
