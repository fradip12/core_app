import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../models/poke/dto/poke_models\.dart';
import 'poke_local_datasource.dart';
import 'poke_remote_datasource.dart';

abstract class PokeDataSource {
  Future<List<PokeModels>> getPokes();
}

@LazySingleton(as: PokeDataSource)
class PokeDataSourceImpl implements PokeDataSource {
  final LocalPokeDataSource localDataSource;
  final RemotePokeDataSource remoteDataSource;

  PokeDataSourceImpl({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<List<PokeModels>> getPokes() async {
    final localData = await localDataSource.getPokes();
    if (localData.isNotEmpty) {
      return localData;
    }
    debugPrint('Fetching from remote source');

    return await remoteDataSource.getPokes();
  }
}
