import 'package:flutter/material.dart';

import '../assets/colors.gen.dart';
import 'ext_dimens.dart';

extension ThemeX on BuildContext {
  /// Get access to TextTheme across the BuildContext.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Outline Input Border Gray
  OutlineInputBorder get inputBorder => OutlineInputBorder(
        borderRadius: (spacingXlg * 2).borderRadius,
        borderSide: const BorderSide(color: ColorName.gray40),
      );

  /// Focused Input Border
  OutlineInputBorder get focusedInputBorder => inputBorder.copyWith(
        borderSide: const BorderSide(color: ColorName.primary),
      );

  /// Error Input Border
  OutlineInputBorder get errorInputBorder => inputBorder.copyWith(
        borderSide: const BorderSide(color: ColorName.error),
      );

  /// Get access to primary ThemeDate across the BuildContext.
  ThemeData get themeData {
    return ThemeData(useMaterial3: true, fontFamily: 'Syne').copyWith(
      primaryColor: ColorName.primary,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        shape: Border(bottom: BorderSide(color: ColorName.gray20)),
        backgroundColor: Colors.white,
        centerTitle: false,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacingLg,
          vertical: spacingMd,
        ),
        border: inputBorder,
        enabledBorder: inputBorder,
        focusedBorder: focusedInputBorder,
        focusedErrorBorder: errorInputBorder,
        errorBorder: errorInputBorder,
        errorStyle: textTheme.bodyMedium?.copyWith(color: ColorName.error),
        hintStyle: textTheme.bodyLarge?.copyWith(color: ColorName.gray60),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: ColorName.primary,
        selectionColor: ColorName.primary.withValues(alpha: 0.2),
        selectionHandleColor: ColorName.primary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: textTheme.bodyMedium,
        selectedLabelStyle: textTheme.bodyMedium,
        unselectedItemColor: ColorName.gray60,
        selectedItemColor: ColorName.primary,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      dividerColor: ColorName.gray40,
      popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: spacingXs.borderRadius,
          side: const BorderSide(color: ColorName.gray40),
        ),
      ),
    );
  }
}
