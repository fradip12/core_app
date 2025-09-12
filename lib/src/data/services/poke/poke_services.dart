import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../shared/models/base_response.dart';
import '../../models/poke/poke_models.dart';

part 'poke_services.g.dart';

@lazySingleton
@RestApi()
abstract class PokeServices {
  @factoryMethod
  factory PokeServices(
    @Named('apiClient') Dio dio, {
    @Named('baseUrl') String baseUrl,
  }) = _PokeServices;

  @GET('pokemon')
  Future<BaseResponse<List<PokeModels>>> getPokes({
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  });
}
