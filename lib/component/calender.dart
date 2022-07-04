import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      focusedDay: DateTime.now(),
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      headerStyle: const HeaderStyle(
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekdayStyle: TextStyle(color: Colors.black),
        weekendStyle: TextStyle(color: Colors.redAccent),
      ),
      calendarStyle: const CalendarStyle(
        selectedTextStyle: TextStyle(
          color: Colors.indigo,
          fontSize: 30.0,
        ),
        todayTextStyle: TextStyle(color: Colors.teal),
        weekendTextStyle: TextStyle(color: Colors.redAccent),
        defaultTextStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
