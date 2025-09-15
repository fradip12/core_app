import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/poke_types_enum.dart';

part 'poke_models.freezed.dart';
part 'poke_models.g.dart';

@freezed
class PokeModels with _$PokeModels {
  const factory PokeModels({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'imageurl') String? imageUrl,
    @JsonKey(name: 'xdescription') String? xDescription,
    @JsonKey(name: 'ydescription') String? yDescription,
    @JsonKey(name: 'height') String? height,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'weight') String? weight,
    @JsonKey(name: 'typeofpokemon') List<String>? typeOfPokemon,
    @JsonKey(name: 'weaknesses') List<String>? weaknesses,
    @JsonKey(name: 'evolutions') List<String>? evolutions,
    @JsonKey(name: 'abilities') List<String>? abilities,
    @JsonKey(name: 'hp') int? hp,
    @JsonKey(name: 'attack') int? attack,
    @JsonKey(name: 'defense') int? defense,
    @JsonKey(name: 'special_attack') int? specialAttack,
    @JsonKey(name: 'special_defense') int? specialDefense,
    @JsonKey(name: 'speed') int? speed,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'male_percentage') String? malePercentage,
    @JsonKey(name: 'female_percentage') String? femalePercentage,
    @JsonKey(name: 'genderless') int? genderless,
    @JsonKey(name: 'cycles') String? cycles,
    @JsonKey(name: 'egg_groups') String? eggGroups,
    @JsonKey(name: 'evolvedfrom') String? evolvedFrom,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'base_exp') String? baseExp,
  }) = _PokeModels;

  factory PokeModels.fromJson(Map<String, dynamic> json) =>
      _$PokeModelsFromJson(json);
}

extension PokeModelsX on PokeModels {
  Color get colors => PokemonTypes.values
      .firstWhere(
        (e) => e.displayName == typeOfPokemon?.first,
      )
      .color;
}

PokeModels mockPokemon = const PokeModels(
  name: '_______',
  id: '_____',
  xDescription:
      'A strange seed was planted on its back at birth. The plant sprouts and grows with this Pokémon.',
  yDescription:
      'For some time after its birth, it grows by gaining nourishment from the seed on its back.',
  height: "2' 04\"",
  category: 'Seed',
  weight: '15.2 lbs',
  typeOfPokemon: ['Unknown'],
  weaknesses: ['Fire', 'Ice', 'Flying', 'Psychic'],
  evolutions: ['#001', '#002', '#003'],
  abilities: ['Overgrow', 'Chlorophyll'],
  hp: 45,
  attack: 49,
  defense: 49,
  specialAttack: 65,
  specialDefense: 65,
  speed: 45,
  total: 318,
  malePercentage: '87.5%',
  femalePercentage: '12.5%',
  genderless: 0,
  cycles: '20 ',
  eggGroups: 'Monster, Grass ',
  evolvedFrom: '',
  reason: '',
  baseExp: '64',
);
