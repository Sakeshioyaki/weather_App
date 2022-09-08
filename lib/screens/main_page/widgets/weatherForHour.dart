import 'package:flutter/material.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';

class WeatherForHour extends StatelessWidget {
  final String time;
  final num maxTemp;
  final num minTemp;
  final num chanceOfRain;
  const WeatherForHour(
      {Key? key,
      required this.time,
      required this.maxTemp,
      required this.minTemp,
      required this.chanceOfRain})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          time,
          style: AppTextStyle.mediumTextWhite,
        ),
        const SizedBox(height: 5),
        Image.asset(
          AppImage.icSunRainDay,
          height: 24,
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              minTemp.toString(),
              style: AppTextStyle.regularText,
            ),
            Image.asset(
              AppImage.degree,
              height: 4,
            ),
            Text(
              '/',
              style: AppTextStyle.regularText,
            ),
            Text(
              maxTemp.toString(),
              style: AppTextStyle.regularText,
            ),
            Image.asset(
              AppImage.degree,
              height: 4,
            ),
          ],
        ),
        Text(
          '$chanceOfRain% rain',
          style: AppTextStyle.regularText,
        ),
      ],
    );
  }
}
