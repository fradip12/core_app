import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class GlobalAppAppBar extends AppBar {
  static const EdgeInsets padding = EdgeInsets.symmetric(horizontal: 28);

  GlobalAppAppBar({
    super.key,
    super.title,
    super.foregroundColor,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTrailingPressed,
  }) : super(
          leading: leading ?? const GlobalAppBarBackButton(),
          actions: <Widget>[
            if (trailing != null)
              GlobalAppBarButton(
                onPressed: onTrailingPressed,
                icon: trailing,
              ),
          ],
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
