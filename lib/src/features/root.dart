import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../shared/assets/assets.gen.dart';
import '../shared/assets/colors.gen.dart';
import '../shared/config/app_router.gr.dart';
import '../shared/extensions/ext_dimens.dart';
import '../shared/extensions/ext_theme.dart';

@RoutePage()
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: <PageRouteInfo>[
        const HomeRoute(),
        const SampleRoute(),
        const SampleRoute(),
        const SampleRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeIn,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (BuildContext context, TabsRouter tabsRouter) {
        return _RootNavBar(
          onTap: (int index) => tabsRouter.setActiveIndex(index),
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}

class _RootNavBar extends StatefulWidget {
  const _RootNavBar({required this.onTap, required this.currentIndex});

  final ValueChanged<int> onTap;
  final int currentIndex;

  @override
  State<_RootNavBar> createState() => _RootNavBarState();
}

class _RootNavBarState extends State<_RootNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(
            activeIconPath: Assets.icons.icNavHomeActive.path,
            iconPath: Assets.icons.icNavHome.path,
            label: 'Pokedex',
            index: 0,
          ),
          _buildNavItem(
            activeIconPath: Assets.icons.icNavNotificationActive.path,
            iconPath: Assets.icons.icNavNotification.path,
            label: 'Moves',
            index: 1,
          ),
          _buildNavItem(
            activeIconPath: Assets.icons.icNavReferralActive.path,
            iconPath: Assets.icons.icNavReferral.path,
            label: 'Evolution',
            index: 3,
          ),
          _buildNavItem(
            activeIconPath: Assets.icons.icNavProfileActive.path,
            iconPath: Assets.icons.icNavProfile.path,
            label: 'Me',
            index: 2,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    String? activeIconPath,
    required String iconPath,
    required String label,
    required int index,
  }) {
    final bool isActive = widget.currentIndex == index;
    return Expanded(
      child: InkWell(
        onTap: () => widget.onTap(index),
        child: Column(
          spacing: context.spacingXs,
          children: <Widget>[
            AnimatedContainer(
              height: context.spacingXxs,
              width: context.deviceWidth,
              margin: EdgeInsets.symmetric(horizontal: context.spacingMd),
              color: !isActive ? Colors.transparent : ColorName.primary,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeInOut,
            ),
            !isActive
                ? SvgPicture.asset(iconPath)
                : SvgPicture.asset(
                    activeIconPath ?? iconPath,
                    colorFilter: const ColorFilter.mode(
                      ColorName.primary,
                      BlendMode.srcIn,
                    ),
                  ),
            Text(
              label,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: !isActive ? FontWeight.w500 : FontWeight.w600,
                color: !isActive ? ColorName.gray60 : ColorName.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
