import 'package:dio/dio.dart';
import 'package:weather/data/interceptor/auth_interceptor.dart';
import 'package:weather/data/model/dto/weather_dto.dart';

abstract class NetworkClient {
  const NetworkClient();

  factory NetworkClient.dio() {
    final dio = Dio();

    dio.interceptors.add(const AuthInterceptor());

    return DioNetworkClient(dio);
  }

  Future<WeatherDto> getWeather({
    required double longitude,
    required double latitude,
  });
}

final class DioNetworkClient extends NetworkClient {
  final Dio _dio;

  const DioNetworkClient(this._dio);

  @override
  Future<WeatherDto> getWeather({
    required double longitude,
    required double latitude,
  }) async {
    final response = await _dio.get(
      'https://api.openweathermap.org/data/2.5/weather',
      queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'units': 'metric',
      },
    );

    if (response.data is Map<String, dynamic>) {
      return WeatherDto.fromJson(response.data);
    }

    throw Exception('Invalid response');
  }
}
