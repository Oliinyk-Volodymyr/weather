import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/data/model/bo/city.dart';
import 'package:weather/feature/details/bloc/city_details_bloc.dart';

class CityItemWidget extends StatelessWidget {
  const CityItemWidget({
    super.key,
    required this.city,
  });

  final City city;

  void _handleTap(BuildContext context) {
    context.read<CityDetailsBloc>().add(CityDetailsEvent.fetch(city: city));
    context.go('/details');
  }

  @override
  Widget build(BuildContext context) {
    final weather = city.weather;
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(city.name),
      trailing: weather == null
          ? null
          : Text(
              '${weather.temp} °C',
              style: textTheme.bodyLarge,
            ),
      onTap: () => _handleTap(context),
    );
  }
}
