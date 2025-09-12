import '../../../shared/models/result.dart';
import '../../models/poke/poke_models.dart';

abstract class PokeRepository {
  Future<Result<List<PokeModels>>> getPokes({
    int? limit,
    int? offset,
  });
}
