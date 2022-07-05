import 'package:amugeona/component/schedule_bottom_sheet.dart';
import 'package:amugeona/component/schedule_card.dart';
import 'package:amugeona/component/today_banner.dart';
import 'package:amugeona/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      floatingActionButton: renderFloatingActionButton(),
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
            _ScheduleList(),
          ],
        ),
      ),
    );
  }

  void PopButton() {
    Navigator.pop(context);
  }
}

FloatingActionButton renderFloatingActionButton() {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (_) {
          return ScheduleBottomSheet();
        },
      );
    },
    backgroundColor: PRIMARY_COLOR,
    child: (Icon(
      Icons.add,
    )),
  );
}



class _ScheduleList extends StatelessWidget {
  const _ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (_) {
            return ScheduleBottomSheet();
          },
        );
      },
      child: ScheduleCard(),
    );
  }
}
