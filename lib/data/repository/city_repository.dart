import 'package:weather/data/model/bo/city.dart';
import 'package:weather/data/model/bo/result.dart';

abstract class CityRepository {
  Future<Result<List<City>>> getCities();
}

class CityRepositoryImpl implements CityRepository {
  const CityRepositoryImpl();

  @override
  Future<Result<List<City>>> getCities() async {
    return const Result.success(
      data: [
        City(
          id: 0,
          name: 'Kyiv',
          latitude: 50.4504,
          longitude: 30.5245,
        ),
        City(
          id: 1,
          name: 'Lviv',
          latitude: 49.8397,
          longitude: 24.0297,
        ),
        City(
          id: 2,
          name: 'Odessa',
          latitude: 46.4702,
          longitude: 30.7306,
        ),
        City(
          id: 3,
          name: 'Dnipro',
          latitude: 48.2758,
          longitude: 35.0131,
        ),
        City(
          id: 4,
          name: 'Kharkiv',
          longitude: 50.0021,
          latitude: 36.1345,
        ),
      ],
    );
  }
}
