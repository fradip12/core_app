import 'package:flutter/material.dart';

import '../../extensions/ext_dimens.dart';
import '../../extensions/ext_theme.dart';

class GlobalLabelWrapper extends StatelessWidget {
  const GlobalLabelWrapper({
    super.key,
    required this.label,
    required this.child,
    this.trailing,
  });

  final String label;
  final Widget child;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacingXs,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: context.spacingMd,
          children: [
            Expanded(child: Text(label, style: context.textTheme.titleMedium)),
            if (trailing != null) trailing!,
          ],
        ),
        child,
      ],
    );
  }
}
