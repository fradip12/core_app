import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../assets/assets.gen.dart';
import '../assets/colors.gen.dart';
import 'ext_dimens.dart';
import 'ext_theme.dart';

enum SnackBarType { info, error, success }

extension OverlaysX on BuildContext {
  Future<T?> showSheet<T>({
    required Widget Function(BuildContext) builder,
    Color? backgroundColor,
    bool useRootNavigator = false,
    bool isScrollControlled = false,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      useSafeArea: true,
      useRootNavigator: useRootNavigator,
      backgroundColor: backgroundColor ?? Colors.white,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      builder: builder,
    );
  }

  void showToast(
    String message, {
    bool isUnderAppbar = false,
    ToastificationType type = ToastificationType.success,
  }) {
    toastification.show(
      context: this,
      type: type,
      dismissDirection: DismissDirection.vertical,
      title: Text(
        message,
        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
      ),
      borderRadius: BorderRadius.circular(spacingMd),
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      autoCloseDuration: const Duration(seconds: 3),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: switch (type) {
        ToastificationType.success => Assets.icons.icSuccess.svg(),
        ToastificationType.error => Assets.icons.icError.svg(),
        ToastificationType.info => Assets.icons.icWarning.svg(
            colorFilter: const ColorFilter.mode(
              Color(0xFFCA9A04),
              BlendMode.srcIn,
            ),
          ),
        _ => Assets.icons.icSuccess.svg(),
      },
      margin: !isUnderAppbar
          ? EdgeInsets.all(spacingMd)
          : EdgeInsets.only(
              top: MediaQuery.of(this).padding.top + kToolbarHeight * .8,
            ),
    );
  }

  void showSnackBar({
    required String message,
    SnackBarType type = SnackBarType.info,
    Color color = Colors.black,
    Color? textColor,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          spacing: spacingMd,
          children: <Widget>[
            Icon(
              switch (type) {
                SnackBarType.info => Icons.info,
                SnackBarType.error => Icons.error,
                SnackBarType.success => Icons.check_circle,
              },
              color: switch (type) {
                SnackBarType.info => Colors.white,
                SnackBarType.error => Colors.red,
                SnackBarType.success => Colors.green,
              },
            ),
            Expanded(
              child: Text(
                message,
                style: textTheme.bodyMedium?.copyWith(
                  color: textColor ?? Colors.white,
                ),
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: spacingSm.borderRadius,
          side: const BorderSide(color: ColorName.gray40),
        ),
        padding: EdgeInsets.all(spacingMd),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
      ),
    );
  }

  void showLoadingOverlay() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.spacingMd),
          ),
          child: const SizedBox(
            width: 75,
            height: 75,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Future<T?> showDialog<T>({
    required Widget Function(BuildContext) builder,
    bool isDismissible = true,
    bool? useRootNavigator,
  }) {
    return showAdaptiveDialog(
      context: this,
      useSafeArea: true,
      useRootNavigator: useRootNavigator ?? true,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) => builder(context),
    );
  }

  void closeOverlay<T>([T? result]) {
    return Navigator.of(this).pop(result);
  }
}
