import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CityDetailsFatalBody extends StatelessWidget {
  const CityDetailsFatalBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Unknown City'),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => context.pop(),
          child: const Text('Go back'),
        ),
      ],
    );
  }
}
