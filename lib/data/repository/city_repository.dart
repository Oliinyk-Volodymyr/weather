import 'package:weather/data/model/city.dart';
import 'package:weather/data/model/result.dart';

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
          name: 'Kyiv',
          longitude: 1,
          latitude: 1,
        ),
        City(
          name: 'Lviv',
          longitude: 1,
          latitude: 1,
        ),
        City(
          name: 'Odessa',
          longitude: 1,
          latitude: 1,
        ),
        City(
          name: 'Dnipro',
          longitude: 1,
          latitude: 1,
        ),
        City(
          name: 'Zaporizhzhia',
          longitude: 1,
          latitude: 1,
        ),
      ],
    );
  }
}
