part of 'city_list_bloc.dart';

sealed class CityListState {
  const CityListState();

  const factory CityListState.loading() = CityListLoading;

  const factory CityListState.loaded({required List<City> cities}) = CityListLoaded;

  const factory CityListState.error() = CityListError;
}

final class CityListLoading extends CityListState {
  const CityListLoading();
}

final class CityListLoaded extends CityListState {
  final List<City> cities;

  const CityListLoaded({
    required this.cities,
  });
}

final class CityListError extends CityListState {
  const CityListError();
}
