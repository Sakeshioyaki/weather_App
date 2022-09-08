import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:untitled/common/app_images.dart';
import 'package:untitled/common/app_text_styles.dart';
import 'package:untitled/fetch_api/home_service.dart';
import 'package:untitled/models/one_call_api_weather.dart';
import 'package:untitled/screens/manage_location/manage_location.dart';
import 'package:untitled/screens/setting_page/setting_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool collapse = true;
  int mainLocation = 0;
  double lat = 48.853409;
  double lon = 2.3488;
  String units = 'metric'; //imperial
  // DateTime curent
  late DateTime currentTime;
  late Future<OneCallAPIWeather> oneCallAPIWeather;

  Future<void> setup() async {
    tz.initializeTimeZones();
  }

  @override
  void initState() {
    super.initState();
    oneCallAPIWeather = HomeService.fetchWeather(lat, lon, units);
    // tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    List<int> indexs = [0, 1, 2];
    int index = 0;
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: const <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        ),
      ],
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
}
