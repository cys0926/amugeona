import 'package:amugeona/const/colors.dart';
import 'package:flutter/material.dart';

import '../component/calender.dart';

class calenderPage extends StatefulWidget {
  const calenderPage({Key? key}) : super(key: key);

  @override
  State<calenderPage> createState() => _calenderPageState();
}

class _calenderPageState extends State<calenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: PRIMARY_COLOR,
        child: TextButton(
          onPressed: PopButton,
          child: Text('완료'),
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
