import 'package:flutter/material.dart';
import 'CalendarWidget.dart';



class CustomCalendar extends StatefulWidget {
  final totalAddMonth;

  const CustomCalendar({Key key, this.totalAddMonth}) : super(key: key);

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime currentDate;
  @override
  void initState() {
    currentDate = DateTime.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(top: 16),
          child: CalendarWidget(
            currentDate: currentDate,
            startDate: getDateByPosition(index),
            onSelect: (DateTime selectedDate){
              setState(() {
                currentDate = selectedDate;
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

    if (monthIndex != 0) {
      startDate = startDate.add(Duration(days: ((monthIndex) * 30)));
    }

    return startDate;
  }

}
