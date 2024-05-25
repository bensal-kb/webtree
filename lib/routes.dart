import 'package:go_router/go_router.dart';
import 'package:webtree/features/weather_details/view/weather_details_page.dart';

import 'features/home/view/home_page.dart';

///Class responsible for routing of the app
class Routes {
  /// [init] specifies the landing page of the application
  static const String init = home;

  static const String home = '/home';
  static const String weatherDetails = '/weatherDetails';

  static GoRouter router = GoRouter(
      initialLocation: init,
      routes: <RouteBase>[
        GoRoute(
          path: home,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: weatherDetails,
          builder: (context, state) => WeatherDetailsPage(
            city: getArgs(state),
          ),
        ),

      ]);

  static getArgs<T>(GoRouterState state) => state.extra as T;

}
