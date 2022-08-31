import 'package:flutter/material.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';

class WeatherInfo extends StatefulWidget {
  final String title;

  const WeatherInfo({Key? key, required this.title}) : super(key: key);

  @override
  State<WeatherInfo> createState() => WeatherInfoState();
}

class WeatherInfoState extends State<WeatherInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 565,
      width: 358,
      decoration: BoxDecoration(
        color: AppColor.blueLightText,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/lightIcon/fluent_weather-rain-showers-day-24-filled.png',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sunday', style: AppTextStyle.normalText),
              const SizedBox(width: 10),
              Container(
                height: 19,
                width: 2,
                color: AppColor.whiteColor,
              ),
              const SizedBox(width: 10),
              Text('Nov 14', style: AppTextStyle.normalText),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '24',
                style: AppTextStyle.tempText,
              ),
              Container(
                height: 65,
                alignment: AlignmentDirectional.topStart,
                child: Image.asset(
                  AppImage.degree,
                  width: 8,
                ),
              ),
            ],
          ),
          Text('Heavy rain', style: AppTextStyle.normalText),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 105,
            width: 326,
          )
        ],
      ),
    );
  }
}
