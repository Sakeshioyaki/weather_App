import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/networks/api_client.dart';
import 'package:untitled/networks/api_util.dart';
import 'package:untitled/reponsitories/weather_reponsitory.dart';
import 'package:untitled/screens/home_page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;

  @override
  void initState() {
    _apiClient = ApiUtil.apiClient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(create: (context) {
          return WeatherRepositoryImpl(apiClient: _apiClient);
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
