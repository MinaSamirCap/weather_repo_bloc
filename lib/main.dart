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
          builder: (ctx) {
            tryAsyncAndYield();
            return WeatherBloc(FakeWeatherRepository());
          },
          child: WeatherSearchPage()),
    );
  }

  /// reference
  /// https://medium.com/@jelenaaa.lecic/what-are-sync-async-yield-and-yield-in-dart-defe57d06381
  void tryAsyncAndYield() {
    //trySync();
    //tryAsync();
    //tryYield();
  }

  void tryYield() {
    print('create iterator');
    Iterable<int> numbers = getNumbersRecursive(3);
    print('starting to iterate...');
    for (int val in numbers) {
      print('$val');
    }
    print('end of main');
  }

  Iterable<int> getNumbersRecursive(int number) sync* {
    print('generator $number started');
    if (number > 0) {
      yield* getNumbersRecursive(number - 1);
    }
    yield number;
    print('generator $number ended');
  }

  void tryAsync() {
    print('create iterator');
    Stream<int> numbers = getNumbersAsync(3);
    print('starting to listen...');
    numbers.listen((int value) {
      print('$value');
    });
    print('end of main');
  }

  Stream<int> getNumbersAsync(int number) async* {
    print('waiting inside generator a bit :)');
    await new Future.delayed(new Duration(seconds: 5)); //sleep 5s
    print('started generating values...');
    for (int i = 0; i < number; i++) {
      await new Future.delayed(new Duration(seconds: 1)); //sleep 1s
      yield i;
    }
    print('ended generating values...');
  }

  void trySync() {
    print('create iterator');
    Iterable<int> numbers = getNumbers(3);
    print('starting to iterate...');
    for (int val in numbers) {
      print('$val');
    }
    print('end of main');
  }

  Iterable<int> getNumbers(int number) sync* {
    print('generator started');
    for (int i = 0; i < number; i++) {
      yield i;
    }
    print('generator ended');
  }
}
