// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:core_app/src/features/etc/samples_page.dart' as _i3;
import 'package:core_app/src/features/pokelist/presentation/pages/pokelist_page.dart'
    as _i1;
import 'package:core_app/src/features/root.dart' as _i2;

/// generated route for
/// [_i1.PokeListPage]
class PokeListRoute extends _i4.PageRouteInfo<void> {
  const PokeListRoute({List<_i4.PageRouteInfo>? children})
    : super(PokeListRoute.name, initialChildren: children);

  static const String name = 'PokeListRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.PokeListPage();
    },
  );
}

/// generated route for
/// [_i2.RootPage]
class RootRoute extends _i4.PageRouteInfo<void> {
  const RootRoute({List<_i4.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.RootPage();
    },
  );
}

/// generated route for
/// [_i3.SamplePage]
class SampleRoute extends _i4.PageRouteInfo<void> {
  const SampleRoute({List<_i4.PageRouteInfo>? children})
    : super(SampleRoute.name, initialChildren: children);

  static const String name = 'SampleRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SamplePage();
    },
  );
}
