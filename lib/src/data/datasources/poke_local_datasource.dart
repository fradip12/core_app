import 'package:injectable/injectable.dart';
import '../models/poke/dto/poke_models\.dart';
import 'poke_datasource.dart';

@Injectable()
class LocalPokeDataSource implements PokeDataSource {
  static const String boxName = 'pokes';

  @override
  Future<List<PokeModels>> getPokes() async {
    // Fetch from local storage/cache
    // return pokeBox.get('pokes') ?? [];
    return [];
  }
}
