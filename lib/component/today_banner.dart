import 'package:flutter/material.dart';

class TodayBanner extends StatelessWidget {
  const TodayBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text('2022년 07월 01일'),],
      )
    );
  }
}
