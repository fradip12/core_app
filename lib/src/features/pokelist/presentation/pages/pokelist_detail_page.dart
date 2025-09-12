import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/poke/poke_models.dart';

@RoutePage()
class PokelistDetailsPage extends StatefulWidget {
  final PokeModels poke;
  const PokelistDetailsPage({super.key, required this.poke});

  @override
  State<PokelistDetailsPage> createState() => _PokelistDetailsPageState();
}

class _PokelistDetailsPageState extends State<PokelistDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              'Pokedex',
            ),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.white.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16.0),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.poke.name ?? '',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Height: ${widget.poke.height ?? '-'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Weight: ${widget.poke.weight ?? '-'}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Types',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
