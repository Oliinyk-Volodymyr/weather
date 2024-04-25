import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/model/city.dart';

part 'city_details_event.dart';
part 'city_details_state.dart';

class CityDetailsBloc extends Bloc<CityDetailsEvent, CityDetailsState> {
  CityDetailsBloc() : super(const CityDetailsState.initial()) {
    on<FetchCityDetailsEvent>(_fetch);
  }

  void _fetch(FetchCityDetailsEvent event, Emitter<CityDetailsState> emit) {
    emit(CityDetailsState.loading(city: event.city));
  }
}
