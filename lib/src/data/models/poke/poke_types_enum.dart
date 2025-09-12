import 'dart:ui';

import '../../../shared/assets/colors.gen.dart';

enum PokemonTypes {
  grass('Grass', ColorName.lightGreen),
  poison('Poison', ColorName.lightPurple),
  fire('Fire', ColorName.lightRed),
  flying('Flying', ColorName.lilac),
  water('Water', ColorName.lightBlue),
  bug('Bug', ColorName.lightTeal),
  normal('Normal', ColorName.beige),
  electric('Electric', ColorName.lightYellow),
  ground('Ground', ColorName.darkBrown),
  fairy('Fairy', ColorName.pink),
  fighting('Fighting', ColorName.red),
  psychic('Psychic', ColorName.lightPink),
  rock('Rock', ColorName.lightBrown),
  steel('Steel', ColorName.grey),
  ice('Ice', ColorName.lightCyan),
  ghost('Ghost', ColorName.purple),
  dragon('Dragon', ColorName.violet),
  dark('Dark', ColorName.black),
  monster('Monster', ColorName.lightBlue),
  unknown('Unknown', ColorName.lightBlue);

  final String displayName;
  final Color color;

  const PokemonTypes(this.displayName, this.color);

  static PokemonTypes parse(String rawValue) => values.firstWhere(
        (e) => e.name == rawValue.toLowerCase(),
        orElse: () => unknown,
      );
}
