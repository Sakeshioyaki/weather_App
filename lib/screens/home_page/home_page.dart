import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';
import 'package:untitled/fetch_api/home_service.dart';
import 'package:untitled/models/current_weather.dart';
import 'package:untitled/screens/manage_location/manage_location.dart';
import 'package:untitled/screens/setting_page/setting_page.dart';

import 'widgets/detailWeather.dart';
import 'widgets/weatherForHour.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool collapse = true;
  int mainLocation = 0;
  double lat = 21.0245;
  double lon = 105.8412;
  String units = 'metric'; //imperial
  late Future<CurrentWeather> currentWeather;
  List<Map> data7Day = [
    {
      'day': 'Sun',
      'chanceOfRain': 13,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSunRainDay',
    },
    {
      'day': 'Mon',
      'chanceOfRain': 32,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSnowy',
    },
    {
      'day': 'Tues',
      'chanceOfRain': 55,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSunRainDay',
    },
    {
      'day': 'Wed',
      'chanceOfRain': 60,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSnowy',
    },
    {
      'day': 'Thu',
      'chanceOfRain': 70,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSnowy',
    },
    {
      'day': 'Fri',
      'chanceOfRain': 99,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSnowy',
    },
    {
      'day': 'Sat',
      'chanceOfRain': 60,
      'maxTemp': 24,
      'minTemp': 20,
      'weather': 'icSnowy'
    },
  ];
  Future<CurrentWeather> fetchData() async {
    final weatherT = await HomeService.fetchWeather(lat, lon, units);
    final currentWeather = weatherT["data"];
    return currentWeather;
  }

  @override
  void initState() {
    super.initState();
    currentWeather = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            FutureBuilder<CurrentWeather>(
              future: currentWeather,
              builder: (context, curWeather) {
                if (curWeather.hasData) {
                  return buildBody(curWeather);
                } else if (curWeather.hasError) {
                  return Text('${curWeather.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            buildDay(),
            collapse ? itemButton() : forecastsFor7Day()
          ],
        ),
      ),
    );
  }

  Widget forecastsFor7Day() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: AppColor.endGradient,
        child: Column(
          children: [
            TextButton(
              onPressed: () async {
                setState(() {
                  collapse = collapse ? false : true;
                });
                // final res = await HomeService.fetchCurrentWeather(lat, lon);
                // print('ddddddd   ${res?.humidity}');
              },
              child: Row(
                children: [
                  Text(
                    'Forecasts for 7 Days',
                    style: AppTextStyle.mediumTextWhite,
                  ),
                  Image.asset(
                    collapse ? AppImage.icDownward : AppImage.icUpward,
                    height: 24,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: data7Day.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      color: AppColor.endGradient,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            data7Day[index]['day'],
                            style: AppTextStyle.mediumTextWhite,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                AppImage.icSnowy,
                                height: 24,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${data7Day[index]['chanceOfRain']}% rain',
                                style: AppTextStyle.regularText,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data7Day[index]['minTemp'].toString(),
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
                                data7Day[index]['maxTemp'].toString(),
                                style: AppTextStyle.regularText,
                              ),
                              Image.asset(
                                AppImage.degree,
                                height: 4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(AsyncSnapshot<CurrentWeather> curWearther) {
    List<int> indexs = [0, 1, 2];
    int index = 0;
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 5, left: 15, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [AppColor.startGradient, AppColor.endGradient],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        buildHeader(indexs, index),
        const SizedBox(
          height: 4,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: collapse
              ? columnContain(indexs, index, curWearther)
              : rowContain(indexs, index, curWearther),
        ),
        const SizedBox(height: 15),
        Container(
          color: Colors.white,
          height: 1.5,
          margin: const EdgeInsets.symmetric(horizontal: 15),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          child: DetailWeather(
            units: units,
            windSpeed: curWearther.data?.windSpeed ?? 0,
            chanceOfRain: 74,
            pressure: curWearther.data?.pressure ?? 0,
            humidity: curWearther.data?.humidity ?? 0,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }

  Widget columnContain(
      List<int> indexs, int index, AsyncSnapshot<CurrentWeather> curWearther) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Image.asset(
            AppImage.icSunRainDay,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('E').format(DateTime.now()),
                style: AppTextStyle.normalText,
              ),
              const SizedBox(width: 10),
              Container(
                height: 19,
                width: 2,
                color: AppColor.whiteColor,
              ),
              const SizedBox(width: 10),
              Text(
                DateFormat('MMMd').format(DateTime.now()),
                style: AppTextStyle.normalText,
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                curWearther.data?.temp.toString() ?? '',
                style: AppTextStyle.tempText.copyWith(height: 1),
              ),
              // units == 'metric' ?
              Image.asset(
                AppImage.degree,
                height: 10,
              ),
            ],
          ),
          Text(
            curWearther.data?.weather?[0].main ?? '',
            style: AppTextStyle.normalText,
          ),
        ],
      ),
    );
  }

  Widget rowContain(
      List<int> indexs, int index, AsyncSnapshot<CurrentWeather> curWearther) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            AppImage.icSunRainDay,
            height: 130,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('E').format(DateTime.now()),
                    style: AppTextStyle.normalText,
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 19,
                    width: 2,
                    color: AppColor.whiteColor,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    DateFormat('MMMd').format(DateTime.now()),
                    style: AppTextStyle.normalText,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    curWearther.data?.temp.toString() ?? '',
                    style: AppTextStyle.tempText.copyWith(height: 1),
                  ),
                  Image.asset(
                    AppImage.degree,
                    height: 10,
                  ),
                ],
              ),
              Text(
                curWearther.data?.weather?[0].main ?? '',
                style: AppTextStyle.normalText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHeader(List<int> indexs, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ManageLocation()),
              );
            },
            child: Image.asset(
              AppImage.icPlus,
              height: 32,
            ),
          ),
          Column(
            children: [
              Text(
                'Malang',
                style: AppTextStyle.semiBold,
              ),
              Row(
                children: indexs
                    .map((e) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                e == index ? Colors.white : Colors.transparent,
                            border: Border.all(color: Colors.white),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingPage()),
              );
            },
            child: Image.asset(
              AppImage.icMenu,
              height: 32,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDay() {
    return Container(
      color: AppColor.endGradient,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  DateFormat('E').format(DateTime.now()),
                  style: AppTextStyle.semiBold,
                ),
                const SizedBox(width: 10),
                Container(
                  height: 19,
                  width: 2,
                  color: AppColor.whiteColor,
                ),
                const SizedBox(width: 10),
                Text(
                  DateFormat('MMMd').format(DateTime.now()),
                  style: AppTextStyle.semiBold,
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                WeatherForHour(
                    time: 'Now', minTemp: 20, maxTemp: 24, chanceOfRain: 76),
                WeatherForHour(
                    time: '10:00', minTemp: 20, maxTemp: 24, chanceOfRain: 69),
                WeatherForHour(
                    time: '11:00', minTemp: 20, maxTemp: 24, chanceOfRain: 62),
                WeatherForHour(
                    time: '12:00', minTemp: 20, maxTemp: 24, chanceOfRain: 53),
                WeatherForHour(
                    time: '13:00', minTemp: 20, maxTemp: 24, chanceOfRain: 45),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget itemButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              collapse = collapse ? false : true;
            });
          },
          child: Row(
            children: [
              Text(
                'Forecasts for 7 Days',
                style: AppTextStyle.mediumText,
              ),
              Image.asset(
                collapse
                    ? AppImage.icDownward
                    : 'assets/lightIcon/eva_arrow-ios-upward-outline.png',
                height: 24,
              )
            ],
          ),
        ),
      ],
    );
  }
}
