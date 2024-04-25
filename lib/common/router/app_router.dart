import 'package:go_router/go_router.dart';
import 'package:weather/feature/list/ui/city_list_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CityListScreen(),
      ),
    ],
  );
}
