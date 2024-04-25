part of 'city_details_bloc.dart';

sealed class CityDetailsState {
  const CityDetailsState();

  const factory CityDetailsState.initial() = CityDetailsInitial;

  const factory CityDetailsState.loading({
    required City city,
  }) = CityDetailsLoading;

  const factory CityDetailsState.loaded({
    required City city,
    required Weather weather,
  }) = CityDetailsLoaded;

  const factory CityDetailsState.error({
    required City city,
  }) = CityDetailsError;
}

final class CityDetailsInitial extends CityDetailsState {
  const CityDetailsInitial();
}

final class CityDetailsLoading extends CityDetailsState {
  final City city;
  const CityDetailsLoading({
    required this.city,
  });
}

final class CityDetailsLoaded extends CityDetailsState {
  final City city;
  final Weather weather;

  const CityDetailsLoaded({
    required this.city,
    required this.weather,
  });
}

final class CityDetailsError extends CityDetailsState {
  final City city;
  const CityDetailsError({
    required this.city,
  });
}
