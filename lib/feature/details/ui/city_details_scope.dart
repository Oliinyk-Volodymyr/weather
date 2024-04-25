import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/feature/details/bloc/city_details_bloc.dart';

class CityDetailsScope extends StatelessWidget {
  const CityDetailsScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CityDetailsBloc(),
      child: child,
    );
  }
}
