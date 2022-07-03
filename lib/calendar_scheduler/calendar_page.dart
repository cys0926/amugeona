import 'package:amugeona/const/colors.dart';
import 'package:flutter/material.dart';

import '../component/calender.dart';

class calendarPage extends StatefulWidget {
  const calendarPage({Key? key}) : super(key: key);

  @override
  State<calendarPage> createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {
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
          ],
        ),
      ),
    );
  }

  void PopButton() {
    Navigator.pop(context);
  }
}
