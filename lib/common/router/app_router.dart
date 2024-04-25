import 'package:go_router/go_router.dart';
import 'package:weather/common/scope/app_scope.dart';
import 'package:weather/feature/details/ui/city_details_screen.dart';
import 'package:weather/feature/list/ui/city_list_scope.dart';
import 'package:weather/feature/list/ui/city_list_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppScope(
          child: CityListScope(child: child),
        ),
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => const CityListScreen(),
            routes: [
              GoRoute(
                path: 'details',
                builder: (_, __) => const CityDetailsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
