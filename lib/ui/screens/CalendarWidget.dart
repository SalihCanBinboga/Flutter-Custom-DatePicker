import 'package:flutter/material.dart';

import 'WeekDaysFirstRow.dart';


class CalendarWidget extends StatefulWidget {
  final DateTime startDate;

  const CalendarWidget({Key key, this.startDate}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  int rowStartDay = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> rows = [];
    rows.add(WeekDaysFirstRow());

    var rowStartElement = widget.startDate.subtract(Duration(days: widget.startDate.day - 1)); // ayın 1. gününü alır

    for (int columnPosition = 1; columnPosition < 7; columnPosition++) { // add 6 row in column

      rows.add(Row(children: prepareOneWeek(rowStartElement, columnPosition)));
      rowStartElement = rowStartElement.add(Duration(days: rowStartDay));

    }

    return Column(children: rows);
  }



  List<Widget> prepareOneWeek(DateTime rowStartDate, int columnPosition) {
    List<Widget> rowItems = [];
    rowStartDay = 0;
    int monthStartDay = rowStartDate.weekday;

    DateTime rowStartDayOnMonth = rowStartDate;
    DateTime nextMonth = DateTime(widget.startDate.year, widget.startDate.month + 1, 0).add(Duration(days: 1));

    if (columnPosition == 1) {
      for (int rowPosition = 1; rowPosition < 8; rowPosition++) { // Create row element (7)

        if (rowPosition == monthStartDay) { // query for month first day

          rowItems.add(_fullDay(rowStartDayOnMonth.day));
          rowStartDayOnMonth = rowStartDayOnMonth.add(Duration(days: 1));
          rowStartDay++;

        } else if (rowPosition > monthStartDay) {

          if (nextMonth.isAfter(rowStartDayOnMonth)) { // is next Month ?

            rowItems.add(_fullDay(rowStartDayOnMonth.day));
            rowStartDayOnMonth = rowStartDayOnMonth.add(Duration(days: 1));
            rowStartDay++;

          } else {
            rowItems.add(_emptyDay);
          }

        } else {
          rowItems.add(_emptyDay);
        }

      }
    } else {
      for (int rowPosition = 1; rowPosition < 8; rowPosition++) { // Create row element (7)
        if (nextMonth.isAfter(rowStartDayOnMonth)) { // is next Month ?

          rowItems.add(_fullDay(rowStartDayOnMonth.day));
          rowStartDayOnMonth = rowStartDayOnMonth.add(Duration(days: 1));
          rowStartDay++;

        } else {

          rowItems.add(_emptyDay);

        }
      }
    }
    return rowItems;
  }
  Widget _fullDay(int day) => Expanded(child: Text(day.toString(), textAlign: TextAlign.center, style: TextStyle(color: Colors.white)));
  Widget get _emptyDay => Expanded(child: Text("boş", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)));
  
}