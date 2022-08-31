import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_text_styles.dart';

class Atmospheric extends StatefulWidget {
  const Atmospheric({Key? key}) : super(key: key);
  @override
  State<Atmospheric> createState() => _AtmosphericState();
}

class _AtmosphericState extends State<Atmospheric> {
  final List<String> items = [
    'mbar',
    'atm',
    'mmHg',
    'inHg',
    'hPa',
  ];
  String? atmospheric = 'mbar';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Atmospheric pressure unit',
            style: AppTextStyle.regularText16,
          ),
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
                          color: atmospheric == item
                              ? AppColor.whiteColor
                              : AppColor.blueDarkText,
                        ),
                      ),
                    ))
                .toList(),
            value: atmospheric,
            onChanged: (value) {
              setState(() {
                atmospheric = value as String;
              });
            },
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            selectedItemHighlightColor: AppColor.startGradient,
            iconEnabledColor: AppColor.whiteColor,
            buttonHeight: 40,
            buttonWidth: 80,
            itemHeight: 40,
          ),
        ),
      ],
    );
  }
}
