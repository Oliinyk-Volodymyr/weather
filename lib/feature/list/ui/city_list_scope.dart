import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/data/repository/city_repository.dart';
import 'package:weather/feature/details/ui/city_details_scope.dart';
import 'package:weather/feature/list/bloc/city_list_bloc.dart';

class CityListScope extends StatelessWidget {
  const CityListScope({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CityListBloc(
        cityRepository: ctx.read<CityRepository>(),
      )..add(const CityListEvent.fetch()),
      child: CityDetailsScope(child: child),
    );
  }
}
