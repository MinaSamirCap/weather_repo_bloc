import 'package:meta/meta.dart';

/// simple model ...
class Weather {
  final String cityName;
  final double temperatureCelsius;
  final double temperatureFahrenheit;

  Weather({
    @required this.cityName,
    @required this.temperatureCelsius,
    this.temperatureFahrenheit,
  });
}
