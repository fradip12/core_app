import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(path: '/', page: RootRoute.page, initial: true, children: [
        AutoRoute(path: 'home', page: PokeListRoute.page),
        AutoRoute(path: 'samples', page: SampleRoute.page),
        RedirectRoute(path: '*', redirectTo: 'home'),
        RedirectRoute(path: '', redirectTo: 'home'),
      ]),
      // Add more routes later.
    ];
  }
}
