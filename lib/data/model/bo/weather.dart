import 'package:weather/data/model/dto/current_weather_dto.dart';

class Weather {
  final int temp;
  final int tempMin;
  final int tempMax;

  @override
  int get hashCode => temp.hashCode ^ tempMin.hashCode ^ tempMax.hashCode;

  const Weather({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory Weather.fromDto(CurrentWeatherDto dto) => Weather(
        temp: dto.temp.round(),
        tempMin: dto.tempMin.round(),
        tempMax: dto.tempMax.round(),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather && other.temp == temp && other.tempMin == tempMin && other.tempMax == tempMax;
  }
}
