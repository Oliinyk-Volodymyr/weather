import 'package:weather/data/model/dto/current_weather_dto.dart';

class WeatherDto {
  final CurrentWeatherDto current;

  const WeatherDto({
    required this.current,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) {
    return WeatherDto(
      current: CurrentWeatherDto.fromJson(json['main']),
    );
  }
}
