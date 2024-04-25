import 'package:flutter/material.dart';
import 'package:weather/data/model/bo/weather.dart';

class CityDetailsLoadedBody extends StatelessWidget {
  const CityDetailsLoadedBody({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weather.temp} °C',
          textAlign: TextAlign.center,
          style: textTheme.headlineLarge,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'H: ${weather.tempMax}',
              style: textTheme.bodyLarge,
            ),
            const SizedBox(width: 8),
            Text(
              'L: ${weather.tempMin}',
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
