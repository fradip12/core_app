// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../data/repositories/poke/poke_repository.dart' as _i105;
import '../../data/repositories/poke/poke_repository_impl.dart' as _i587;
import '../../data/services/poke/poke_services.dart' as _i1037;
import '../../features/pokelist/presentation/managers/pokelist_bloc.dart'
    as _i595;
import '../utils/secure_storage.dart' as _i455;
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
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => appModules.storage);
    gh.lazySingleton<_i455.SecureStorage>(() => appModules.dataStorage);
    gh.lazySingleton<_i361.Dio>(
      () => appModules.dio,
      instanceName: 'apiClient',
    );
    await gh.lazySingletonAsync<String>(
      () => appModules.baseUrl,
      instanceName: 'baseUrl',
      preResolve: true,
    );
    gh.lazySingleton<_i1037.PokeServices>(() => _i1037.PokeServices(
          gh<_i361.Dio>(instanceName: 'apiClient'),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.lazySingleton<_i105.PokeRepository>(() =>
        _i587.PokeRepositoryImpl(pokeServices: gh<_i1037.PokeServices>()));
    gh.factory<_i595.PokelistBloc>(
        () => _i595.PokelistBloc(gh<_i105.PokeRepository>()));
    return this;
  }
}

class _$AppModules extends _i460.AppModules {}
