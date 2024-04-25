part of 'city_details_bloc.dart';

sealed class CityDetailsEvent {
  const CityDetailsEvent();

  const factory CityDetailsEvent.fetch({
    required City city,
  }) = FetchCityDetailsEvent;
}

final class FetchCityDetailsEvent extends CityDetailsEvent {
  final City city;

  const FetchCityDetailsEvent({
    required this.city,
  });
}
