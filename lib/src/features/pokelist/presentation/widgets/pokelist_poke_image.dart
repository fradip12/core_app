import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/poke/dto/poke_models\.dart';
import '../../../../shared/assets/assets.gen.dart';
import '../../../../shared/extensions/ext_misc.dart';

class PokemonImage extends StatelessWidget {
  static const Size _cacheMaxSize = Size(700, 700);

  final PokeModels pokemon;
  final EdgeInsets padding;
  final Size size;
  final ImageProvider? placeholder;
  final Color? tintColor;

  const PokemonImage({
    super.key,
    required this.pokemon,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.placeholder,
    this.tintColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuint,
      padding: padding,
      child: CachedNetworkImage(
        imageUrl: pokemon.imageUrl.orEmpty,
        useOldImageOnUrlChange: true,
        maxWidthDiskCache: _cacheMaxSize.width.toInt(),
        maxHeightDiskCache: _cacheMaxSize.height.toInt(),
        fadeInDuration: const Duration(milliseconds: 120),
        fadeOutDuration: const Duration(milliseconds: 120),
        imageBuilder: (_, image) => Image(
          image: image,
          width: size.width,
          height: size.height,
          alignment: Alignment.bottomCenter,
          color: tintColor,
          fit: BoxFit.contain,
        ),
        placeholder: (_, __) => Image(
          image: placeholder ?? Assets.images.bulbasaur.provider(),
          width: size.width,
          height: size.height,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          fit: BoxFit.contain,
        ),
        errorWidget: (_, __, ___) => Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: placeholder ?? Assets.images.bulbasaur.provider(),
              width: size.width,
              height: size.height,
              color: Colors.black12,
            ),
            Icon(
              Icons.warning_amber_rounded,
              size: size.width * 0.3,
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}
