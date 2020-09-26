import 'package:flutter/material.dart';
import 'MonthCalendarWidget.dart';

typedef void OnResultDate(DateTime dateTime);

class CalendarWidget extends StatefulWidget {
  final totalAddMonth;
  final OnResultDate onResultDate;

  const CalendarWidget({Key key, this.totalAddMonth, this.onResultDate}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime currentDate;

  @override
  void initState() {
    currentDate = DateTime.now();
    currentDate = DateTime(currentDate.year,currentDate.month,currentDate.day);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 16),
          child: MonthCalendarWidget(
            currentDate: currentDate,
            startDate: getDateByPosition(index),
            onSelect: (DateTime selectedDate) {
              setState(() {
                currentDate = selectedDate;
                widget.onResultDate(selectedDate);
/*                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Tarih Onayı"),
                        content: Text("Tarih: $selectedDate}"),
                        actions: <Widget>[
                          RaisedButton(
                            child: Text("Onayla"),
                            onPressed: () => {
                              widget.onResultDate(selectedDate),
                            },
                          )
                        ],
                      );
                    });*/
              });
            },
          ),
        );
      },
      itemCount: getTotalMonth(widget.totalAddMonth),
    );
  }



  int getTotalMonth(int addDayCount) {
    var addFiveMonthAtNow = DateTime.now().add(Duration(days: addDayCount * 30));
    var calculatedYear = addFiveMonthAtNow.year - DateTime.now().year;
    var calculatedMonthCount = 12 * calculatedYear;
    return calculatedMonthCount + addFiveMonthAtNow.month - DateTime.now().month;
  }
  DateTime getDateByPosition(int monthIndex) {
    DateTime startDate = DateTime.now();
    startDate = DateTime(startDate.year,startDate.month,startDate.day);

    if (monthIndex != 0) {
      startDate = startDate.add(Duration(days: ((monthIndex) * 30)));
    }

    return startDate;
  }
}
