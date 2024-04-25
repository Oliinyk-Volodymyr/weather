import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/common/widget/error_body.dart';
import 'package:weather/common/widget/loading_body.dart';
import 'package:weather/feature/list/bloc/city_list_bloc.dart';
import 'package:weather/feature/list/ui/city_list_loaded_body.dart';

class CityListScreen extends StatelessWidget {
  const CityListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City List'),
      ),
      body: BlocBuilder<CityListBloc, CityListState>(
        builder: (_, state) => switch (state) {
          CityListLoading() => const LoadingBody(),
          CityListError() => ErrorBody(
              onRetry: () => context.read<CityListBloc>().add(const CityListEvent.fetch()),
            ),
          CityListLoaded(:final cities) => CityListLoadedBody(cities: cities),
        },
      ),
    );
  }
}
