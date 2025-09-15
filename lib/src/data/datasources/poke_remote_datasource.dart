import 'package:injectable/injectable.dart';
import '../models/poke/dto/poke_models\.dart';
import '../services/poke/poke_services.dart';
import 'poke_datasource.dart';

@Injectable()
class RemotePokeDataSource implements PokeDataSource {
  final PokeServices pokeServices;

  RemotePokeDataSource({required this.pokeServices});

  @override
  Future<List<PokeModels>> getPokes() async {
    return await pokeServices.getPokes();
  }
}
