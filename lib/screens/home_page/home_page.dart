import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:untitled/common/api_key.dart';
import 'package:untitled/common/app_colors.dart';
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';
import 'package:untitled/models/json_annotation.dart';
import 'package:untitled/networks/api_client.dart';
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
  num lat = 48.853409;
  num lon = 2.3488;
  String units = 'metric'; //imperial
  final dio = Dio();
  // late ApiClient apiClient = ApiClient(dio);
  // DateTime curent
  late DateTime currentTime;
  late Future<OneCallAPIWeather> oneCallAPIWeather;
  final client = ApiClient(Dio(BaseOptions(contentType: "application/json")));

  Future<void> setup() async {
    tz.initializeTimeZones();
    // apiClient = ApiClient(dio);
  }

  Future<OneCallAPIWeather> getAPIWeather() async {
    return client.getOneCallAPIWeather(lat, lon,
        units: units, appid: ApiKey.keyAPI);
  }

  @override
  void initState() {
    super.initState();
    final weatherRepo = RepositoryProvider.of<MovieRepository>(context);
    // tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: FutureBuilder<OneCallAPIWeather>(
          future: oneCallAPIWeather,
          builder: (context, weather) {
            if (weather.hasData) {
              return Column(
                children: [
                  buildBody(weather),
                  buildDay(weather),
                  collapse ? itemButton() : forecastsFor7Day(weather)
                ],
              );
            } else if (weather.hasError) {
              return Text('${weather.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Widget forecastsFor7Day(AsyncSnapshot<OneCallAPIWeather> weather) {
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
                // final res = await HomeService.fetchoneCallAPIWeather(lat, lon);
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
                  itemCount: 7,
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
                            DateFormat('EEEE')
                                .format(DateTime(
                                    currentTime.year,
                                    currentTime.month,
                                    currentTime.day + index + 1,
                                    currentTime.hour))
                                .toString(),
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
                                '${((weather.data?.daily?[index].pop ?? 0) * 100).toInt()} % rain',
                                style: AppTextStyle.regularText,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                weather.data?.daily?[index].temp?.min
                                        .toString() ??
                                    '0',
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
                                weather.data?.daily?[index].temp?.max
                                        .toString() ??
                                    '0',
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

  Widget buildBody(AsyncSnapshot<OneCallAPIWeather> oneCallAPIWeather) {
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
              ? columnContain(indexs, index, oneCallAPIWeather)
              : rowContain(indexs, index, oneCallAPIWeather),
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
            windSpeed: oneCallAPIWeather.data?.current?.windSpeed ?? 0,
            chanceOfRain: 74,
            pressure: oneCallAPIWeather.data?.current?.pressure ?? 0,
            humidity: oneCallAPIWeather.data?.current?.humidity ?? 0,
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }

  Widget columnContain(List<int> indexs, int index,
      AsyncSnapshot<OneCallAPIWeather> oneCallAPIWeather) {
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
                oneCallAPIWeather.data?.current?.temp.toString() ?? '',
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
            oneCallAPIWeather.data?.current?.weather?[0].main ?? '',
            style: AppTextStyle.normalText,
          ),
        ],
      ),
    );
  }

  Widget rowContain(List<int> indexs, int index,
      AsyncSnapshot<OneCallAPIWeather> oneCallAPIWeather) {
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
                    oneCallAPIWeather.data?.current?.temp.toString() ?? '',
                    style: AppTextStyle.tempText.copyWith(height: 1),
                  ),
                  Image.asset(
                    AppImage.degree,
                    height: 10,
                  ),
                ],
              ),
              Text(
                oneCallAPIWeather.data?.current?.weather?[0].main ?? '',
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

  Widget buildDay(AsyncSnapshot<OneCallAPIWeather> weather) {
    setup();
    var detroit = tz.getLocation(weather.data?.timezone ?? 'Asia/Bangkok');
    tz.setLocalLocation(detroit);
    currentTime = tz.TZDateTime.now(detroit);

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
              children: [
                WeatherForHour(
                    time: 'Now',
                    minTemp: weather.data?.hourly?[0].temp ?? 0,
                    maxTemp: weather.data?.hourly?[0].temp ?? 0,
                    chanceOfRain:
                        ((weather.data?.hourly?[0].pop ?? 0) * 100).toInt()),
                WeatherForHour(
                    time: DateFormat.Hm()
                        .format(DateTime(currentTime.year, currentTime.month,
                            currentTime.day, currentTime.hour + 1))
                        .toString(),
                    minTemp: weather.data?.hourly?[0].temp ?? 0,
                    maxTemp: weather.data?.hourly?[0].temp ?? 0,
                    chanceOfRain:
                        ((weather.data?.hourly?[1].pop ?? 0) * 100).toInt()),
                WeatherForHour(
                    time: DateFormat.Hm()
                        .format(DateTime(currentTime.year, currentTime.month,
                            currentTime.day, currentTime.hour + 2))
                        .toString(),
                    minTemp: 20,
                    maxTemp: 24,
                    chanceOfRain:
                        ((weather.data?.hourly?[2].pop ?? 0) * 100).toInt()),
                WeatherForHour(
                    time: DateFormat.Hm()
                        .format(DateTime(currentTime.year, currentTime.month,
                            currentTime.day, currentTime.hour + 3))
                        .toString(),
                    minTemp: 20,
                    maxTemp: 24,
                    chanceOfRain:
                        ((weather.data?.hourly?[3].pop ?? 0) * 100).toInt()),
                WeatherForHour(
                    time: DateFormat.Hm()
                        .format(DateTime(currentTime.year, currentTime.month,
                            currentTime.day, currentTime.hour + 4))
                        .toString(),
                    minTemp: 20,
                    maxTemp: 24,
                    chanceOfRain:
                        ((weather.data?.hourly?[4].pop ?? 0) * 100).toInt()),
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
