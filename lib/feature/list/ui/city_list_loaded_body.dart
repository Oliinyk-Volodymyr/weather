import 'package:flutter/material.dart';
import 'package:weather/data/model/city.dart';
import 'package:weather/feature/list/ui/city_item_widget.dart';

class CityListLoadedBody extends StatelessWidget {
  const CityListLoadedBody({
    super.key,
    required this.cities,
  });

  final List<City> cities;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cities.length,
      separatorBuilder: (_, __) => const Divider(endIndent: 16, indent: 16, height: 1),
      itemBuilder: (_, index) => CityItemWidget(city: cities[index]),
    );
  }
}
