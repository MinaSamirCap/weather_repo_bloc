part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class GetWether extends WeatherEvent {
  final String cityName;

  /// const constructor means if I passed the same cityName
  /// the dart will not create new instance it will return the same instance if exists
  /// so I will not fill the memory with a lot of instances.
  const GetWether(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class GetDetailsWether extends WeatherEvent {
  final String cityName;

  /// const constructor means if I passed the same cityName
  /// the dart will not create new instance it will return the same instance if exists
  /// so I will not fill the memory with a lot of instances.
  const GetDetailsWether(this.cityName);

  @override
  List<Object> get props => [cityName];
}
