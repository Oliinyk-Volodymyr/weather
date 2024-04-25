import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/common/widget/error_body.dart';
import 'package:weather/common/widget/loading_body.dart';
import 'package:weather/feature/details/bloc/city_details_bloc.dart';
import 'package:weather/feature/details/ui/city_details_appbar_title_widget.dart';
import 'package:weather/feature/details/ui/city_details_fatal_body.dart';
import 'package:weather/feature/details/ui/city_details_loaded_body.dart';

class CityDetailsScreen extends StatelessWidget {
  const CityDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CityDetailsAppbarTitleWidget(),
      ),
      body: BlocBuilder<CityDetailsBloc, CityDetailsState>(
        builder: (_, state) => switch (state) {
          CityDetailsInitial() => const CityDetailsFatalBody(),
          CityDetailsLoading() => const LoadingBody(),
          CityDetailsLoaded(:final weather) => CityDetailsLoadedBody(
              weather: weather,
            ),
          CityDetailsError(:final city) => ErrorBody(
              onRetry: () => context.read<CityDetailsBloc>().add(CityDetailsEvent.fetch(city: city)),
            ),
        },
      ),
    );
  }
}
