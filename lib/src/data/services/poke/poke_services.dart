import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/poke/dto/poke_models.dart';
import 'poke_path.dart';

part 'poke_services.g.dart';

@lazySingleton
@RestApi()
abstract class PokeServices {
  @factoryMethod
  factory PokeServices(
    @Named('apiClient') Dio dio, {
    @Named('baseUrl') String baseUrl,
  }) = _PokeServices;

  @GET(PokePathList.pokelist)
  Future<List<PokeModels>> getPokes();
}
