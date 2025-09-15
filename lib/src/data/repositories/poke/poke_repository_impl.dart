import 'package:injectable/injectable.dart';

import '../../../shared/models/base_results.dart';
import '../../../shared/utils/callbacks.dart';
import '../../models/poke/dto/poke_models.dart';
import '../../services/poke/poke_services.dart';
import 'poke_repository.dart';

@LazySingleton(as: PokeRepository)
class PokeRepositoryImpl implements PokeRepository {
  final PokeServices pokeServices;

  PokeRepositoryImpl({required this.pokeServices});
  @override
  Future<Result<List<PokeModels>>> getPokes() {
    return Callbacks.executeWithTryCatch<List<PokeModels>>(
      operation: () async {
        final response = await pokeServices.getPokes();
        return response;
      },
    );
  }
}
