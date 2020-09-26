import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'WeekDaysFirstRow.dart';

typedef void OnSelect(DateTime date);

class MonthCalendarWidget extends StatefulWidget {
  final DateTime startDate;
  final DateTime currentDate;
  final OnSelect onSelect;

  const MonthCalendarWidget({Key key, this.startDate, this.currentDate, this.onSelect}) : super(key: key);

  @override
  _MonthCalendarWidgetState createState() => _MonthCalendarWidgetState();
}

class _MonthCalendarWidgetState extends State<MonthCalendarWidget> {
  int rowStartDay = 0;
  List<String> monthsTR;
  DateTime onTapDate;

  @override
  void initState() {
    monthsTR = List.unmodifiable({"Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"});
    onTapDate = DateTime(2000, 01, 01);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: createRows());
  }

  List<Widget> createRows() {
    List<Widget> rows = [];
    rows.add(dateInfoWidget);
    rows.add(SizedBox(height: 8));
    rows.add(Divider(
      height: 3,
    ));
    rows.add(SizedBox(height: 8));
    rows.add(WeekDaysFirstRow());
    rows.add(SizedBox(height: 16));

    var rowStartElement = widget.startDate.subtract(Duration(days: widget.startDate.day - 1)); // ayın 1. gününü alır

    for (int columnPosition = 1; columnPosition < 7; columnPosition++) {
      // add 6 row in column

      rows.add(Row(children: prepareOneWeek(rowStartElement, columnPosition)));
      rowStartElement = rowStartElement.add(Duration(days: rowStartDay));
    }
    return rows;
  }

  List<Widget> prepareOneWeek(DateTime rowStartDate, int columnPosition) {
    List<Widget> rowItems = [];
    rowStartDay = 0;
    int monthStartDay = rowStartDate.weekday;

    DateTime rowStartDayOnMonth = rowStartDate;
    DateTime nextMonth = DateTime(widget.startDate.year, widget.startDate.month + 1, 0).add(Duration(days: 1));

    if (columnPosition == 1) {
      for (int rowPosition = 1; rowPosition < 8; rowPosition++) {
        // Create row element (7)

        if (rowPosition == monthStartDay) {
          // query for month first day

          rowItems.add(_fullDay(rowStartDayOnMonth));
          rowStartDayOnMonth = rowStartDayOnMonth.add(Duration(days: 1));
          rowStartDay++;
        } else if (rowPosition > monthStartDay) {
          if (nextMonth.isAfter(rowStartDayOnMonth)) {
            // is next Month ?

            rowItems.add(_fullDay(rowStartDayOnMonth));
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
      for (int rowPosition = 1; rowPosition < 8; rowPosition++) {
        // Create row element (7)
        if (nextMonth.isAfter(rowStartDayOnMonth)) {
          // is next Month ?

          rowItems.add(_fullDay(rowStartDayOnMonth));
          rowStartDayOnMonth = rowStartDayOnMonth.add(Duration(days: 1));
          rowStartDay++;
        } else {
          rowItems.add(_emptyDay);
        }
      }
    }
    return rowItems;
  }

  Widget _fullDay(DateTime date) => Expanded(
        child: InkWell(
          onTap: () => {
            setState(() {
              onTapDate = date;
              widget.onSelect(date);
            })
          },
          child: Container(
            color: isDateToday(date) ? Colors.pink : Colors.white,
            margin: EdgeInsets.all(5),
            height: 32,
            width: 32,
            alignment: Alignment.center,
            child: Text(
              date.day.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: isDateToday(date) ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );

  bool isDateToday(DateTime rowDateTime) {
    rowDateTime = DateTime(rowDateTime.year, rowDateTime.month, rowDateTime.day);
    DateTime currentNewDate = DateTime(widget.currentDate.year, widget.currentDate.month, widget.currentDate.day);
    //DateTime tapDateModify = DateTime(onTapDate.year,onTapDate.month,onTapDate.day);

    if (rowDateTime == currentNewDate) {
      return true;
    } else {
      return false;
    }
  }

  Widget get _emptyDay => Expanded(child: Text("", textAlign: TextAlign.center, style: TextStyle(color: Colors.white)));

  Widget get dateInfoWidget => Center(child: Text("${monthsTR[widget.startDate.month - 1]} ${widget.startDate.year.toString()}"));
}
