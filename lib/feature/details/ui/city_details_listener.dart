import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/details/bloc/city_details_bloc.dart';
import 'package:weather/feature/list/bloc/city_list_bloc.dart';

class CityDetailsListener extends StatelessWidget {
  const CityDetailsListener({
    super.key,
    required this.child,
  });

  final Widget child;

  void _handleListener(BuildContext ctx, CityDetailsState state) {
    if (state is CityDetailsLoaded) {
      ctx.read<CityListBloc>().add(CityListEvent.fetchWeather(
            city: state.city,
            weather: state.weather,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CityDetailsBloc, CityDetailsState>(
      listener: _handleListener,
      child: child,
    );
  }
}
