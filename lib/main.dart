import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/app.dart';

void main() {
  runZonedGuarded(
    () => runApp(const App()),
    (error, stack) {
      //TODO() Handle uncaught errors
    },
  );
}
