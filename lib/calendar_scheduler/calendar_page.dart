import 'package:amugeona/component/today_banner.dart';
import 'package:amugeona/const/colors.dart';
import 'package:flutter/material.dart';

import '../component/calender.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: PRIMARY_COLOR,
        child: TextButton(
          onPressed: PopButton,
          child: Text('OK'),
          style: TextButton.styleFrom(
            primary: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Calender(),
            SizedBox(height: 8.0),
            TodayBanner(),
            SizedBox(height: 8.0),
            ScheduleList(),
          ],
        ),
      ),
    );
  }

  void PopButton() {
    Navigator.pop(context);
  }
}

class ScheduleList extends StatelessWidget {
  const ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('할 일'),
    );
  }
}
