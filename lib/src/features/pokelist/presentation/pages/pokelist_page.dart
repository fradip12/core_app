import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../data/models/poke/poke_models.dart';
import '../../../../shared/config/app_di.dart';
import '../../../../shared/extensions/ext_misc.dart';
import '../managers/pokelist_bloc.dart';
import '../widgets/pokelist_poke_card.dart';

@RoutePage()
class PokeListPage extends StatefulWidget {
  const PokeListPage({super.key});

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  late final PokelistBloc bloc;

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
      child: Scaffold(
        body: BlocBuilder<PokelistBloc, PokelistState>(
          builder: (context, state) {
            final List<PokeModels> pokes = state.maybeWhen(
              loading: () => List.generate(
                10,
                (index) => const PokeModels(
                  pokeName: '________',
                  pokeUrl: '_________',
                ),
              ),
              loaded: (pokes) => pokes ?? [],
              orElse: () => [],
            );
            return Skeletonizer(
              enabled: state.maybeWhen(
                loading: () => true,
                loaded: (pokes) => false,
                orElse: () => false,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: pokes.length,
                itemBuilder: (context, index) {
                  return PokeCard(
                    image: pokes[index].imageUrl.orDefault,
                    name: pokes[index].pokeName.orDefault,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
