import 'package:flutter/material.dart';

import '../../extensions/ext_theme.dart';

class GlobalSliverAppbar extends SliverAppBar {
  GlobalSliverAppbar(
    BuildContext context, {
    super.key,
    GlobalKey? appBarKey,
    String title = 'Pokedex',
    double height = kToolbarHeight + 48,
    double expandedFontSize = 30,
    Widget? leading,
    VoidCallback? onTrailingPressed,
    Color backgroundColor = Colors.transparent,
  }) : super(
          automaticallyImplyLeading: true,
          expandedHeight: 120.0,
          floating: true,
          pinned: true,
          snap: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}
