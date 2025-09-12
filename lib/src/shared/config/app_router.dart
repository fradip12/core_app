import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      // AutoRoute(path: '/auth', page: AuthRoute.page, initial: true),
      // Add more routes later.
    ];
  }
}
