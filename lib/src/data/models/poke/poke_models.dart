import 'package:freezed_annotation/freezed_annotation.dart';

part 'poke_models.freezed.dart';
part 'poke_models.g.dart';

@freezed
class PokeModels with _$PokeModels {
  const factory PokeModels({
    @JsonKey(name: 'name') String? pokeName,
    @JsonKey(name: 'url') String? pokeUrl,
  }) = _PokeModels;

  factory PokeModels.fromJson(Map<String, dynamic> json) =>
      _$PokeModelsFromJson(json);
}

extension XPokeModels on PokeModels {
  int? get pokeId {
    if (pokeUrl == null) return null;
    final segments = pokeUrl!.split('/');
    if (segments.length < 2) return null;
    return int.tryParse(segments[segments.length - 2]);
  }

  String? get imageUrl {
    final id = pokeId;
    if (id == null) return null;
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}
