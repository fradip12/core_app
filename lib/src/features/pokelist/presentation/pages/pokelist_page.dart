import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/poke/dto/poke_models\.dart';
import '../../../../shared/components/wrapper/global_scaffold_wrapper.dart';
import '../../../../shared/components/wrapper/globall_sliver_appbar_wrapper.dart';
import '../../../../shared/config/app_di.dart';
import '../../../../shared/config/app_router.gr.dart';
import '../../../../shared/extensions/ext_misc.dart';
import '../managers/pokelist_bloc.dart';
import '../widgets/pokelist_poke_card.dart';

@RoutePage()
class PokelistPage extends StatefulWidget {
  const PokelistPage({super.key});

  @override
  State<StatefulWidget> createState() => _PokelistPageState();
}

class _PokelistPageState extends State<PokelistPage> {
  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: const Stack(
        children: [
          _PokemonGrid(),
          // _FabMenu(),
        ],
      ),
    );
  }
}

class _PokemonGrid extends StatefulWidget {
  const _PokemonGrid();

  @override
  State<_PokemonGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<_PokemonGrid> {
  late PokelistBloc bloc;

  @override
  void initState() {
    bloc = locator<PokelistBloc>();
    bloc.add(const PokelistEvent.load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: NestedScrollView(
        headerSliverBuilder: (_, __) => [
          GlobalSliverAppbar(context, title: 'Pokedex'),
        ],
        body: BlocBuilder<PokelistBloc, PokelistState>(
          builder: (context, state) {
            final poke = state.pokes ??
                List.generate(
                  20,
                  (index) => mockPokemon,
                );
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return PokemonCard(
                          poke[index],
                        ).onTap(
                          () {
                            bloc.add(
                              PokelistEvent.select(
                                poke[index].id.orEmpty,
                              ),
                            );
                            context.router.push(PokelistDetailsRoute(
                              poke: poke[index],
                            ));
                          },
                        );
                      },
                      childCount: poke.length,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
