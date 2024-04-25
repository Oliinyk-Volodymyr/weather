import 'package:weather/data/model/bo/weather.dart';

class City {
  final int id;
  final String name;

  final double longitude;
  final double latitude;

  final Weather? weather;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ longitude.hashCode ^ latitude.hashCode ^ weather.hashCode;

  const City({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
    this.weather,
  });

  City copyWith({
    int? id,
    String? name,
    double? longitude,
    double? latitude,
    Weather? weather,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      weather: weather ?? this.weather,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is City &&
        other.id == id &&
        other.name == name &&
        other.longitude == longitude &&
        other.latitude == latitude &&
        other.weather == weather;
  }
}
