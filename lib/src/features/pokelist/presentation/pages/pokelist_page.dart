import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/poke/poke_models.dart';
import '../../../../shared/components/displays/global_app_bar.dart';
import '../../../../shared/components/wrapper/global_scaffold_wrapper.dart';
import '../../../../shared/config/app_di.dart';
import '../../../../shared/extensions/ext_misc.dart';
import '../../../../shared/utils/text_size.dart';
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
          AppMovingTitleSliverAppBar(title: 'Pokedex'),
        ],
        body: BlocBuilder<PokelistBloc, PokelistState>(
          builder: (context, state) {
            //         {
            //     "name": "Charmander",
            //     "id": "#004",
            //     "imageurl": "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png",
            //     "xdescription": "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.",
            //     "ydescription": "The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.",
            //     "height": "2' 00\"",
            //     "category": "Lizard",
            //     "weight": "18.7 lbs",
            //     "typeofpokemon": [
            //         "Fire"
            //     ],
            //     "weaknesses": [
            //         "Ground",
            //         "Rock",
            //         "Water"
            //     ],
            //     "evolutions": [
            //         "#004",
            //         "#005",
            //         "#006"
            //     ],
            //     "abilities": [
            //         "Blaze"
            //     ],
            //     "hp": 20,
            //     "attack": 30,
            //     "defense": 20,
            //     "special_attack": 30,
            //     "special_defense": 20,
            //     "speed": 40,
            //     "total": 160,
            //     "male_percentage": "87.5%",
            //     "female_percentage": "12.5%",
            //     "genderless": 0,
            //     "cycles": "20 ",
            //     "egg_groups": "Dragon, Monster ",
            //     "evolvedfrom": "",
            //     "reason": "",
            //     "base_exp": "62"
            // },
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
                            // bloc.add(
                            //   PokelistEvent.select(
                            //     poke[index].id.orEmpty,
                            //   ),
                            // );
                            // context.router.push(PokelistDetailsRoute(
                            //   poke: poke[index],
                            // ));
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

class AppMovingTitleSliverAppBar extends SliverAppBar {
  static const TextStyle _textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: kToolbarHeight / 3,
    height: 1,
  );

  AppMovingTitleSliverAppBar({
    super.key,
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + 48,
    double expandedFontSize = 30,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          expandedHeight: height,
          pinned: true,
          backgroundColor: Colors.transparent,
          leading: leading ?? const GlobalAppBarBackButton(),
          actions: [
            if (trailing != null)
              GlobalAppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final safeAreaTop = MediaQuery.paddingOf(context).top;
              final minHeight = safeAreaTop + kToolbarHeight;
              final maxHeight = height + safeAreaTop;

              final percent =
                  (constraints.maxHeight - minHeight) / (maxHeight - minHeight);
              final fontSize = _textStyle.fontSize ?? 16;
              final currentTextStyle = _textStyle.copyWith(
                fontSize: fontSize + (expandedFontSize - fontSize) * percent,
              );

              final textWidth =
                  getTextSize(context, title, currentTextStyle).width;
              final startX = GlobalAppAppBar.padding.left;
              final endX =
                  MediaQuery.sizeOf(context).width / 2 - textWidth / 2 - startX;
              final dx = startX + endX - endX * percent;

              return Container(
                color: Colors.white.withValues(alpha: 0.8 - percent * 0.8),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: kToolbarHeight / 3),
                      child: Transform.translate(
                        offset:
                            Offset(dx, constraints.maxHeight - kToolbarHeight),
                        child: Text(
                          title,
                          style: currentTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
}

class GlobalAppBarButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const GlobalAppBarButton({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: GlobalAppAppBar.padding,
      onPressed: onPressed,
      icon: icon,
    );
  }
}

class GlobalAppBarBackButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const GlobalAppBarBackButton({
    super.key,
    this.icon = const Icon(Icons.arrow_back_rounded),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (!context.router.canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      padding: GlobalAppAppBar.padding,
      onPressed: onPressed ?? context.router.maybePop,
      icon: icon,
    );
  }
}
