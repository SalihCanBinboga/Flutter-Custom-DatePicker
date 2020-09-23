import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber),
      home: HomeScreen(),
    );
  }
}

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
        color: Colors.pink,
      ),
    );
  }
}
