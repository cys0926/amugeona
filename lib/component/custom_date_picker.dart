import 'package:amugeona/const/colors.dart';
import 'package:amugeona/const/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

class CustomDatePicker extends StatelessWidget {
  final selectedDate;
  const CustomDatePicker({
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
   FutureBuilder(BuildContext context) async {
    DateTime? newSelectedDate = await showRoundedDatePicker(
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
