import 'package:flutter/material.dart';

import '../../../../data/models/poke/enums/poke_types_enum.dart';

class PokemonType extends StatelessWidget {
  const PokemonType(
    this.type, {
    super.key,
    this.large = false,
    this.extra = '',
  });

  final PokemonTypes type;
  final String extra;
  final bool large;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 19 : 12,
          vertical: large ? 6 : 4,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: Colors.black.withValues(alpha: 0.3),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              type.displayName,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 5),
            Text(
              extra,
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
