class CurrentWeatherDto {
  final double temp;
  final double tempMin;
  final double tempMax;

  const CurrentWeatherDto({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
  });

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherDto(
      temp: json['temp'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
    );
  }
}
