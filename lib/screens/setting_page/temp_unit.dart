import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';

class TempUnit extends StatefulWidget {
  const TempUnit({Key? key}) : super(key: key);
  @override
  State<TempUnit> createState() => _TempUnitState();
}

class _TempUnitState extends State<TempUnit> {
  final List<String> items = [
    'C',
    'F',
  ];
  String? tempUnit = 'C';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Temperature unit',
          style: AppTextStyle.regularText16,
        ),
        buildDropdown(),
      ],
    );
  }

  Widget buildDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: buildItemDrop(item),
                ))
            .toList(),
        value: tempUnit,
        onChanged: (value) {
          setState(() {
            tempUnit = value as String;
          });
        },
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        selectedItemHighlightColor: AppColor.startGradient,
        iconEnabledColor: AppColor.whiteColor,
        buttonHeight: 40,
        buttonWidth: 70,
        itemHeight: 40,
      ),
    );
  }

  Widget buildItemDrop(String item) {
    return Row(
      children: [
        Container(
          height: 12,
          alignment: Alignment.topCenter,
          width: 4,
          child: Image.asset(
            AppImage.degree,
            height: 4,
          ),
        ),
        Text(
          item,
          style: TextStyle(
            fontSize: 14,
            color:
                tempUnit == item ? AppColor.whiteColor : AppColor.blueDarkText,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
