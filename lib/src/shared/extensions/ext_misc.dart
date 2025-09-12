import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../assets/assets.gen.dart';
import '../assets/colors.gen.dart';

extension MiscX on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this);
  }
}

extension NullableDateTimeX on DateTime? {
  String get formatted {
    if (this == null) return '-';
    return DateFormat('MMM dd, HH:mm', 'ko').format(this!);
  }
}

extension NullableStringX on String? {
  String get orEmpty => this ?? '';
  String get orDefault => this != null && this!.isNotEmpty ? this! : '-';
  String truncateWithEllipsis(int maxLength) {
    if (orEmpty.length <= maxLength) return orEmpty;
    final int partLength = (maxLength - 3) ~/ 2;
    return '${orEmpty.substring(0, partLength)}...'
        '${orEmpty.substring(orEmpty.length - partLength)}';
  }
}

extension NullableIntX on num? {
  int get orZeroInt => this?.toInt() ?? 0;
  double get orZeroDouble => this?.toDouble() ?? 0.0;
}

extension NullableListX<T> on List<T>? {
  List<T> get orEmpty => this ?? <T>[];
}

extension NullableBoolX on bool? {
  bool get orFalse => this ?? false;
}

extension DividerX on double {
  Widget get hDivider => Divider(
        thickness: this,
        color: ColorName.gray20,
        height: 0.0,
      );
}

extension ListExtension<T> on List<T>? {
  T? firstWhereOrNull(
    bool Function(T element) test,
  ) {
    if (this == null) return null;
    for (final element in this!) {
      if (test(element)) return element;
    }
    return null;
  }
}

extension AnimationDurationX on int {
  Duration get animateDuration => Duration(milliseconds: this);
}

extension WidgetAnimationX on Widget {
  Widget get animated =>
      animate().fadeIn(duration: const Duration(milliseconds: 800));
}

extension SvgX on SvgGenImage {
  SvgPicture icon({double? size, Color? color}) {
    return this.svg(
      colorFilter: ColorFilter.mode(
        color ?? Colors.black,
        BlendMode.srcIn,
      ),
      height: size,
      width: size,
    );
  }
}
