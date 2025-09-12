import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../data/models/poke/poke_types_enum.dart';
import '../shared/components/displays/global_app_search_bar.dart';
import '../shared/components/interactive/global_category_card.dart';
import '../shared/components/wrapper/global_scaffold_wrapper.dart';
import '../shared/config/app_router.gr.dart';
import '../shared/extensions/ext_theme.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Text(
                'What Pokemon\nare you looking for?',
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GlobalAppSearch(
              hintText: 'Search Pokemon, Move, Ability etc',
            ),
            GridView(
              padding: const EdgeInsets.symmetric(vertical: 36),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 2.58,
                mainAxisSpacing: 15,
              ),
              children: [
                GlobalCategoryCard(
                  title: 'Pokedex',
                  color: AppColors.teal,
                  onPressed: () => context.navigateTo(const PokelistRoute()),
                ),
                const GlobalCategoryCard(
                  title: 'Moves',
                  color: AppColors.red,
                ),
                const GlobalCategoryCard(
                  title: 'Abilities',
                  color: AppColors.blue,
                ),
                const GlobalCategoryCard(
                  title: 'Items',
                  color: AppColors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
