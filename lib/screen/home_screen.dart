import 'dart:io';
import 'package:flutter/src/services/message_codec.dart';
import 'package:amugeona/const/colors.dart';
import 'package:amugeona/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import '../calendar_scheduler/calendar_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? pickedImage;
  int countDDay = 0;
  String imagePath = '';

  @override
  void initState() {
    super.initState();
    _loadCountDDay();
    _loadImagePath();
  }

  _loadImagePath() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imagePath = (prefs.getString('imagePath') ?? '');
    });
  }

  _loadCountDDay() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countDDay = (prefs.getInt('countDDay') ?? 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _MainPicture(
            image: File(imagePath),
          ),
          _TopPart(
            onHeartPressed: setDDay,
            onPicturePressed: pickImage,
            onDatePressed: onDatePressed,
            countDDay: countDDay,
          ),
        ],
      ),
    );
  }

  pickImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        imagePath = image.path;
        prefs.setString('imagePath', imagePath);
      });
  }

  setDDay() async {
    DateTime? newSelectedDate = await showRoundedDatePicker(
      context: context,
      fontFamily: "Sunflower",
      initialDate: DateTime.now(),
      firstDate: DateTime(1997),
      lastDate: DateTime.now(),
      height: MediaQuery.of(context).size.height / 2,
      imageHeader: const AssetImage("asset/img/date_picker_image.jpg"),
      description: "처음 만난 날짜를 선택해주세요.",
      styleDatePicker: MaterialRoundedDatePickerStyle(
        textStyleDayButton: CalendarMainTextStyle,
        textStyleYearButton: CalendarMainTextStyle,
        paddingDateYearHeader:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newSelectedDate != null)
      setState(() {
        countDDay = DateTime.now().difference(newSelectedDate).inDays.toInt();
        prefs.setInt('countDDay', countDDay);
      });
  }

  void onDatePressed() {
    Get.to(CalendarPage());
  }
}

class _MainPicture extends StatelessWidget {
  final File? image;

  const _MainPicture({
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image?.path == ''
        ? Image.asset(
            'asset/img/middle_image.png',
            color: Colors.white.withOpacity(0.5),
            colorBlendMode: BlendMode.modulate,
          )
        : Image.file(
            image!,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.white.withOpacity(0.9),
            colorBlendMode: BlendMode.modulate,
          );
  }
}

class _TopPart extends StatelessWidget {
  final VoidCallback onDatePressed;
  final VoidCallback onPicturePressed;
  final VoidCallback onHeartPressed;
  final int countDDay;

  const _TopPart({
    required this.onPicturePressed,
    required this.onDatePressed,
    required this.onHeartPressed,
    required this.countDDay,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                'D+${countDDay + 1}',
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
