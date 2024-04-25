import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/model/bo/city.dart';
import 'package:weather/data/model/bo/result.dart';
import 'package:weather/data/model/bo/weather.dart';
import 'package:weather/data/repository/city_repository.dart';

part 'city_list_event.dart';
part 'city_list_state.dart';

class CityListBloc extends Bloc<CityListEvent, CityListState> {
  final CityRepository _cityRepository;

  CityListBloc({
    required CityRepository cityRepository,
  })  : _cityRepository = cityRepository,
        super(const CityListState.loading()) {
    on<FetchCityListEvent>(_fetch);
    on<FetchWeatherCityListEvent>(_fetchWeather);
  }

  Future<void> _fetch(FetchCityListEvent event, Emitter<CityListState> emit) async {
    final result = await _cityRepository.getCities();

    final updatedState = switch (result) {
      SuccessResult<List<City>>(:final data) => CityListState.loaded(cities: data),
      ErrorResult<List<City>>() => const CityListState.error(),
    };

    emit(updatedState);
  }

  void _fetchWeather(FetchWeatherCityListEvent event, Emitter<CityListState> emit) {
    final currentState = state;
    final city = event.city;
    final weather = event.weather;

    if (currentState is! CityListLoaded) return;

    final updatedCities =
        currentState.cities.map((c) => c.id == city.id ? city.copyWith(weather: weather) : c).toList();

    final updatedState = CityListLoaded(
      cities: updatedCities,
    );

    emit(updatedState);
  }
}
