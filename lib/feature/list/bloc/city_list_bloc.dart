import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/model/city.dart';
import 'package:weather/data/model/result.dart';
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
  }

  Future<void> _fetch(FetchCityListEvent event, Emitter<CityListState> emit) async {
    final result = await _cityRepository.getCities();

    final updatedState = switch (result) {
      SuccessResult<List<City>>(:final data) => CityListState.loaded(cities: data),
      ErrorResult<List<City>>() => const CityListState.error(),
    };

    emit(updatedState);
  }
}
