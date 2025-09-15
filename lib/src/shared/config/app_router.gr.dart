// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:core_app/src/data/models/poke/dto/poke_models.dart' as _i8;
import 'package:core_app/src/features/etc/samples_page.dart' as _i5;
import 'package:core_app/src/features/home_page.dart' as _i1;
import 'package:core_app/src/features/pokelist/presentation/pages/pokelist_detail_page.dart'
    as _i2;
import 'package:core_app/src/features/pokelist/presentation/pages/pokelist_page.dart'
    as _i3;
import 'package:core_app/src/features/root.dart' as _i4;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.PokelistDetailsPage]
class PokelistDetailsRoute extends _i6.PageRouteInfo<PokelistDetailsRouteArgs> {
  PokelistDetailsRoute({
    _i7.Key? key,
    required _i8.PokeModels poke,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PokelistDetailsRoute.name,
          args: PokelistDetailsRouteArgs(
            key: key,
            poke: poke,
          ),
          initialChildren: children,
        );

  static const String name = 'PokelistDetailsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PokelistDetailsRouteArgs>();
      return _i2.PokelistDetailsPage(
        key: args.key,
        poke: args.poke,
      );
    },
  );
}

class PokelistDetailsRouteArgs {
  const PokelistDetailsRouteArgs({
    this.key,
    required this.poke,
  });

  final _i7.Key? key;

  final _i8.PokeModels poke;

  @override
  String toString() {
    return 'PokelistDetailsRouteArgs{key: $key, poke: $poke}';
  }
}

/// generated route for
/// [_i3.PokelistPage]
class PokelistRoute extends _i6.PageRouteInfo<void> {
  const PokelistRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PokelistRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokelistRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.PokelistPage();
    },
  );
}

/// generated route for
/// [_i4.RootPage]
class RootRoute extends _i6.PageRouteInfo<void> {
  const RootRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.RootPage();
    },
  );
}

/// generated route for
/// [_i5.SamplePage]
class SampleRoute extends _i6.PageRouteInfo<void> {
  const SampleRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SampleRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SamplePage();
    },
  );
}
