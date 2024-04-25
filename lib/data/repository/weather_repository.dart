import 'package:weather/data/model/bo/city.dart';
import 'package:weather/data/model/bo/result.dart';
import 'package:weather/data/model/bo/weather.dart';
import 'package:weather/data/source/network_client.dart';

abstract class WeatherRepository {
  Future<Result<Weather>> getWeather(City city);
}

class WeatherRepositoryImpl implements WeatherRepository {
  final NetworkClient _networkClient;

  const WeatherRepositoryImpl({
    required NetworkClient networkClient,
  }) : _networkClient = networkClient;

  @override
  Future<Result<Weather>> getWeather(City city) async {
    try {
      final response = await _networkClient.getWeather(
        latitude: city.latitude,
        longitude: city.longitude,
      );
      final weather = Weather.fromDto(response.current);

      return Result.success(data: weather);
    } catch (_) {
      // in this place we should convert exception to our error model
      return const Result.error();
    }
  }
}
