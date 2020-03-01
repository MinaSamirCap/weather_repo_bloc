import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weater_repo/bloc/weather_bloc.dart';
import 'package:weater_repo/data/weather_repository.dart';
import 'package:weater_repo/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: BlocProvider(
          builder: (ctx) => WeatherBloc(FakeWeatherRepository()),
          child: WeatherSearchPage()),
    );
  }
}
