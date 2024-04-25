import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/model/bo/city.dart';
import 'package:weather/data/model/bo/result.dart';
import 'package:weather/data/model/bo/weather.dart';
import 'package:weather/data/repository/weather_repository.dart';

part 'city_details_event.dart';
part 'city_details_state.dart';

class CityDetailsBloc extends Bloc<CityDetailsEvent, CityDetailsState> {
  final WeatherRepository _weatherRepository;

  CityDetailsBloc(
    WeatherRepository weatherRepository,
  )   : _weatherRepository = weatherRepository,
        super(const CityDetailsState.initial()) {
    on<FetchCityDetailsEvent>(_fetch);
  }

  Future<void> _fetch(FetchCityDetailsEvent event, Emitter<CityDetailsState> emit) async {
    final city = event.city;

    emit(CityDetailsState.loading(city: city));
    final result = await _weatherRepository.getWeather(city);

    final updatedState = switch (result) {
      SuccessResult<Weather>() => CityDetailsState.loaded(
          city: city,
          weather: result.data,
        ),
      ErrorResult<Weather>() => CityDetailsState.error(city: city),
    };

    emit(updatedState);
  }
}
