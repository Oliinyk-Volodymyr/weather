part of 'city_list_bloc.dart';

sealed class CityListEvent {
  const CityListEvent();

  const factory CityListEvent.fetch() = FetchCityListEvent;
}

final class FetchCityListEvent extends CityListEvent {
  const FetchCityListEvent();
}
