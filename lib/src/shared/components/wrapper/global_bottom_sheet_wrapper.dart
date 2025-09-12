import 'package:flutter/material.dart';

import '../../assets/colors.gen.dart';
import '../../extensions/ext_dimens.dart';
import '../../extensions/ext_misc.dart';
import '../../extensions/ext_theme.dart';

class GlobalBottomSheetWrapper extends StatelessWidget {
  const GlobalBottomSheetWrapper({
    super.key,
    required this.title,
    required this.child,
    this.childPadding,
    this.actions,
    this.bottom,
    this.bottomPadding,
    this.enableCloseButton = true,
  });

  final String title;
  final Widget child;
  final EdgeInsetsGeometry? childPadding;
  final Widget? actions;
  final Widget? bottom;
  final EdgeInsetsGeometry? bottomPadding;
  final bool enableCloseButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.viewInsetsBottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: context.spacingXs),
            child: Column(
              spacing: context.spacingXxs,
              children: [
                Container(
                  height: context.spacingXxs,
                  width: context.deviceWidth * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: context.spacingMd.borderRadius,
                    color: ColorName.gray40,
                  ),
                ),
                Row(
                  spacing: context.spacingMd,
                  children: <Widget>[
                    IconButton(
                      icon: enableCloseButton
                          ? const Icon(Icons.close)
                          : const SizedBox(),
                      onPressed: enableCloseButton
                          ? () => Navigator.pop(context)
                          : null,
                    ),
                    Expanded(
                      child: Text(
                        title,
                        textAlign: actions == null
                            ? TextAlign.center
                            : TextAlign.start,
                        style: context.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    actions ??
                        const IconButton(
                          icon: SizedBox(),
                          onPressed: null,
                        ),
                  ],
                ),
              ],
            ),
          ),
          1.0.hDivider,
          Flexible(
            child: SingleChildScrollView(
              padding: childPadding ?? EdgeInsets.all(context.spacingMd),
              child: SafeArea(child: child),
            ),
          ),
          if (bottom != null) ...[
            context.spacingXxs.vSpace,
            1.0.hDivider,
            SafeArea(
              child: Padding(
                padding: bottomPadding ?? EdgeInsets.all(context.spacingMd),
                child: bottom!,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
