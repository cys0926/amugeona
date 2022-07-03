import 'package:amugeona/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final selectedDate = DateTime(
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
          ),
        ],
      ),
    );
  }

  onHeartPressed() async {
    const CalendarDateTextStyle = TextStyle(
        fontSize: 16.0,
        color: Colors.black54,
        fontFamily: "Sunflower",
        fontWeight: FontWeight.w500);
    const CalendarMainTextStyle = TextStyle(
      fontSize: 30.0,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: "Sunflower",
    );
    const CalendarSubTextStyle = TextStyle(
      fontSize: 25.0,
      color: PRIMARY_COLOR,
      fontFamily: "Sunflower",
      fontWeight: FontWeight.w700,
    );
    const CalendarButtonTextStyle = TextStyle(
      fontSize: 20.0,
      color: Colors.black54,
      fontWeight: FontWeight.w700,
      fontFamily: "Sunflower",
    );
    DateTime? selectedDate = await showRoundedDatePicker(
      context: context,
      fontFamily: "Sunflower",
      initialDate: DateTime.now(),
      firstDate: DateTime(1997),
      lastDate: DateTime.now(),
      imageHeader: const AssetImage("asset/img/date_picker_image.jpg"),
      description: "처음 만난 날짜를 선택해주세요.",
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayButton: CalendarMainTextStyle,
        textStyleYearButton: CalendarMainTextStyle,
        paddingDateYearHeader:
            const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        textStyleMonthYearHeader: CalendarSubTextStyle,
        sizeArrow: 20,
        colorArrowNext: PRIMARY_COLOR,
        colorArrowPrevious: PRIMARY_COLOR,
        paddingMonthHeader: const EdgeInsets.symmetric(vertical: 23),
        textStyleDayHeader: CalendarSubTextStyle.copyWith(fontSize: 20.0),
        textStyleCurrentDayOnCalendar: CalendarDateTextStyle.copyWith(
          color: PRIMARY_COLOR,
        ),
        textStyleDayOnCalendar: CalendarDateTextStyle,
        textStyleDayOnCalendarSelected: CalendarDateTextStyle.copyWith(
          color: Colors.white,
        ),
        textStyleDayOnCalendarDisabled: CalendarDateTextStyle.copyWith(
          color: Colors.grey.withOpacity(0.3),
        ),
        paddingDatePicker: const EdgeInsets.symmetric(horizontal: 20.0),
        marginLeftArrowPrevious: 16,
        marginTopArrowPrevious: 16,
        marginTopArrowNext: 16,
        marginRightArrowNext: 16,
        textStyleButtonAction: CalendarButtonTextStyle,
        textStyleButtonPositive: CalendarButtonTextStyle,
        textStyleButtonNegative: CalendarButtonTextStyle.copyWith(
          color: Colors.grey.withOpacity(0.3),
        ),
        decorationDateSelected: const BoxDecoration(
          color: PRIMARY_COLOR,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  void onPicturePressed() {
    print('onPicturePressed');
  }

  void onDatePressed() {
    print('onDatePressed');
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

  const _TopPart({
    required this.onPicturePressed,
    required this.onDatePressed,
    required this.onHeartPressed,
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
              Text('D+${DateTime(
                    now.year,
                    now.month,
                    now.day,
                  ).difference(DateTime.now()).inDays + 1}'),
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
