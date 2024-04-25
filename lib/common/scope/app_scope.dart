import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repository/city_repository.dart';

class AppScope extends StatelessWidget {
  const AppScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<CityRepository>(
      create: (_) => const CityRepositoryImpl(),
      child: child,
    );
  }
}
