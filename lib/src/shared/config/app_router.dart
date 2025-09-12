import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        path: '/',
        page: RootRoute.page,
        initial: true,
        children: [
          AutoRoute(
            path: 'home',
            page: HomeRoute.page,
            initial: true,
          ),
          AutoRoute(path: 'samples', page: SampleRoute.page),
        ],
      ),
      AutoRoute(
        path: '/pokedex',
        page: PokelistRoute.page,
      ),
      // Add more routes later.
    ];
  }

  @override
  RouteType get defaultRouteType => const RouteType.custom(
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
}
