import 'package:flutter/material.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';

class DetailWeather extends StatefulWidget {
  final num windSpeed;
  final num chanceOfRain;
  final num pressure;
  final num humidity;
  final String units;

  const DetailWeather(
      {Key? key,
      required this.windSpeed,
      required this.chanceOfRain,
      required this.pressure,
      required this.humidity,
      required this.units})
      : super(key: key);

  @override
  State<DetailWeather> createState() => _DetailWeatherState();
}

class _DetailWeatherState extends State<DetailWeather> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            windSpeed(),
            chanceOfRain(),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            pressure(),
            humidity(),
          ],
        ),
      ],
    );
  }

  Widget humidity() {
    return SizedBox(
      width: 122,
      child: Row(
        children: [
          Image.asset(
            AppImage.icHumidity,
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.humidity}%',
                style: AppTextStyle.regularText,
              ),
              Text(
                'Humidity',
                style: AppTextStyle.regularText,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget pressure() {
    return Row(
      children: [
        Image.asset(
          AppImage.icTemperA,
          height: 32,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.pressure} hPa',
              style: AppTextStyle.regularText,
            ),
            Text(
              'Pressure',
              style: AppTextStyle.regularText,
            )
          ],
        ),
      ],
    );
  }

  Widget chanceOfRain() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          AppImage.icRain,
          height: 32,
          width: 32,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.chanceOfRain} %',
              style: AppTextStyle.regularText,
            ),
            Text(
              'Chance of rain',
              style: AppTextStyle.regularText,
            ),
          ],
        ),
      ],
    );
  }

  Widget windSpeed() {
    return Row(
      children: [
        Image.asset(
          AppImage.icWind,
          height: 32,
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.units == 'imperial'
                  ? '${widget.windSpeed} miles/h'
                  : '${widget.windSpeed} m/s',
              style: AppTextStyle.regularText,
            ),
            Text(
              'Wind',
              style: AppTextStyle.regularText,
            )
          ],
        ),
      ],
    );
  }
}
