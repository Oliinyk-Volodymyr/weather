import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repository/weather_repository.dart';
import 'package:weather/data/source/network_client.dart';
import 'package:weather/feature/details/bloc/city_details_bloc.dart';
import 'package:weather/feature/details/ui/city_details_listener.dart';

class CityDetailsScope extends StatelessWidget {
  const CityDetailsScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<WeatherRepository>(
      create: (_) => WeatherRepositoryImpl(networkClient: NetworkClient.dio()),
      child: BlocProvider(
        create: (ctx) => CityDetailsBloc(ctx.read<WeatherRepository>()),
        child: CityDetailsListener(child: child),
      ),
    );
  }
}
