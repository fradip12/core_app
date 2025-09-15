import 'package:flutter/material.dart';

import '../../../../data/models/poke/dto/poke_models\.dart';
import '../../../../data/models/poke/enums/poke_types_enum.dart';
import '../../../../shared/assets/assets.gen.dart';
import '../../../../shared/extensions/ext_misc.dart';
import 'pokelist_poke_image.dart';
import 'pokelist_poke_type.dart';

import 'package:skeletonizer/skeletonizer.dart';

class PokemonCard extends StatelessWidget {
  final PokeModels pokemon;
  final void Function()? onPress;

  const PokemonCard(
    this.pokemon, {
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: pokemon.colors,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: pokemon.colors.withValues(alpha: 0.4),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Material(
              color: pokemon.colors,
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _PokeballDecoration(height: itemHeight),
                    _PokemonBuild(
                      height: itemHeight,
                      pokemon: pokemon,
                    ),
                    _PokemonNumber(pokemon: pokemon),
                    _CardContent(pokemon),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  final PokeModels pokemon;

  const _CardContent(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              pokemon.name.orEmpty,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ..._buildTypes(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTypes(BuildContext context) {
    return PokemonTypes.values
        .where((type) =>
            pokemon.typeOfPokemon?.contains(type.displayName) ?? false)
        .take(2)
        .map(
          (type) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: PokemonType(type),
          ),
        )
        .toList();
  }
}

class _PokeballDecoration extends StatelessWidget {
  static const double _pokeballFraction = 0.75;

  final double height;
  const _PokeballDecoration({required this.height});

  @override
  Widget build(BuildContext context) {
    final pokeballSize = height * _pokeballFraction;

    return Positioned(
      bottom: -height * 0.13,
      right: -height * 0.03,
      child: Image(
        image: Assets.images.imgPokeball.provider(),
        width: pokeballSize,
        height: pokeballSize,
        color: Colors.white.withValues(alpha: 0.14),
      ),
    );
  }
}

class _PokemonBuild extends StatelessWidget {
  static const double _pokemonFraction = 0.76;

  final double height;
  final PokeModels pokemon;
  const _PokemonBuild({
    required this.height,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final pokemonSize = height * _pokemonFraction;

    return Positioned(
      bottom: -2,
      right: 2,
      child: Stack(
        children: [
          if (pokemon.id != '#mock')
            Hero(
              tag: 'pokemon-${pokemon.id}',
              child: PokemonImage(
                size: Size.square(pokemonSize),
                pokemon: pokemon,
              ),
            ),
        ],
      ),
    );
  }
}

class _PokemonNumber extends StatelessWidget {
  final PokeModels pokemon;

  const _PokemonNumber({
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        pokemon.id.orEmpty,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }
}
