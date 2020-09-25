import 'package:flutter/material.dart';
import 'CalendarScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Calendar App"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context) => CalendarScreen()))},
          color: Colors.blue,
          child: Text(
            "Takvimi Aç",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
