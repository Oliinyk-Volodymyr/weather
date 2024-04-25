part of 'city_list_bloc.dart';

sealed class CityListEvent {
  const CityListEvent();

  const factory CityListEvent.fetch() = FetchCityListEvent;

  const factory CityListEvent.fetchWeather({
    required City city,
    required Weather weather,
  }) = FetchWeatherCityListEvent;
}

final class FetchCityListEvent extends CityListEvent {
  const FetchCityListEvent();
}

final class FetchWeatherCityListEvent extends CityListEvent {
  final City city;
  final Weather weather;

  const FetchWeatherCityListEvent({
    required this.city,
    required this.weather,
  });
}
