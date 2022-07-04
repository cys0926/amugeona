import 'package:amugeona/const/colors.dart';
import 'package:amugeona/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../calendar_scheduler/calendar_page.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const _MainPicture(),
          _TopPart(
            onHeartPressed: onHeartPressed,
            onPicturePressed: onPicturePressed,
            onDatePressed: onDatePressed,
            selectedDate: selectedDate,
          ),
        ],
      ),
    );
  }

  onHeartPressed() async {
  }

  void onPicturePressed() {
    print('onPicturePressed');
  }

  void onDatePressed() {
    Get.to(CalendarPage());
  }
}

class _MainPicture extends StatelessWidget {
  const _MainPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/img/middle_image.png',
      color: Colors.white.withOpacity(0.5),
      colorBlendMode: BlendMode.modulate,
    );
  }
}

class _TopPart extends StatelessWidget {
  final VoidCallback onDatePressed;
  final VoidCallback onPicturePressed;
  final VoidCallback onHeartPressed;
  final DateTime selectedDate;

  const _TopPart({
    required this.onPicturePressed,
    required this.onDatePressed,
    required this.onHeartPressed,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              renderIconButton(
                onPressed: onHeartPressed,
                iconData: Icons.favorite,
              ),
              Text(
                'D+${DateTime(
                      now.year,
                      now.month,
                      now.day,
                    ).difference(selectedDate).inDays + 1}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              renderIconButton(
                onPressed: onDatePressed,
                iconData: Icons.calendar_month,
              ),
              renderIconButton(
                onPressed: onPicturePressed,
                iconData: Icons.photo,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: IconButton(
        onPressed: onPressed,
        iconSize: 32.0,
        color: PRIMARY_COLOR,
        icon: Icon(
          iconData,
        ),
      ),
    );
  }
}
