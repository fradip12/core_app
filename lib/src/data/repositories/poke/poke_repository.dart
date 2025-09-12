import '../../../shared/models/base_results.dart';
import '../../models/poke/poke_models.dart';

abstract class PokeRepository {
  Future<Result<List<PokeModels>>> getPokes();
}
