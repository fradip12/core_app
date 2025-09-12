import 'package:flutter/material.dart';

import '../../../../shared/assets/assets.gen.dart';

class PokelistPokeballDecoration extends StatelessWidget {
  final double height;
  const PokelistPokeballDecoration({
    super.key,
    required this.height,
  });
  static const double _pokeballFraction = 0.75;

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
