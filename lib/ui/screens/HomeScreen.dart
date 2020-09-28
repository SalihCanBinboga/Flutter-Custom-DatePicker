import 'package:flutter/material.dart';
import 'CalendarScreen.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
                  (dateTime) => _showDate(dateTime),
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
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Gelen Tarih: $dateTime"),
          ],
        ),
      ),
    ));
  }
}
