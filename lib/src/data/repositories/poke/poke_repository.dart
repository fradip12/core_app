import '../../../shared/models/base_results.dart';
import '../../models/poke/dto/poke_models.dart';

abstract class PokeRepository {
  Future<Result<List<PokeModels>>> getPokes();
}
