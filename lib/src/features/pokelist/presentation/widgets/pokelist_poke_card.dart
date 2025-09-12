import 'package:flutter/material.dart';

import '../../../../shared/components/displays/global_cached_image.dart';

class PokeCard extends StatelessWidget {
  final String image;
  final String name;
  const PokeCard({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GlobalCacheImage(
          size: 100,
          image: image,
          fit: BoxFit.contain,
        ),
        Text(
          name.toUpperCase(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
