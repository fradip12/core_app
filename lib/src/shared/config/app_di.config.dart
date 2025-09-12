// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/pokelist/presentation/managers/pokelist_bloc.dart'
    as _i595;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModules = _$AppModules();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => appModules.prefs,
      preResolve: true,
    );
    gh.factory<_i595.PokelistBloc>(() => _i595.PokelistBloc());
    return this;
  }
}

class _$AppModules extends _i460.AppModules {}
