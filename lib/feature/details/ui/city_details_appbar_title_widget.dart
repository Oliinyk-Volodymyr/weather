import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/details/bloc/city_details_bloc.dart';

class CityDetailsAppbarTitleWidget extends StatelessWidget {
  const CityDetailsAppbarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityDetailsBloc, CityDetailsState>(
      builder: (_, state) => switch (state) {
        CityDetailsInitial() => const Text('Unknown City'),
        CityDetailsLoading(:final city) ||
        CityDetailsLoaded(:final city) ||
        CityDetailsError(:final city) =>
          Text(city.name),
      },
    );
  }
}
