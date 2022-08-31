import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_text_styles.dart';

class WindSpeed extends StatefulWidget {
  const WindSpeed({Key? key}) : super(key: key);
  @override
  State<WindSpeed> createState() => _WindSpeedState();
}

class _WindSpeedState extends State<WindSpeed> {
  final List<String> items = [
    'km/h',
    'mil/h',
    'm/s',
    'kn',
  ];
  String? windSpeed = 'km/h';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Wind speed unit',
          style: AppTextStyle.regularText16,
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14,
                          color: windSpeed == item
                              ? AppColor.whiteColor
                              : AppColor.blueDarkText,
                        ),
                      ),
                    ))
                .toList(),
            value: windSpeed,
            onChanged: (value) {
              setState(() {
                windSpeed = value as String;
              });
            },
            selectedItemHighlightColor: AppColor.startGradient,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            iconEnabledColor: AppColor.whiteColor,
            buttonHeight: 40,
            buttonWidth: 70,
            itemHeight: 40,
          ),
        ),
      ],
    );
  }
}
