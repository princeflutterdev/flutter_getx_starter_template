import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/extensions.dart';
import 'package:flutter_getx_starter_template/app/common/values/app_colors.dart';
import 'package:flutter_getx_starter_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_starter_template/app/common/values/styles/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTheme {
  static ThemeData get theme {
    final inputBorder = 16.outlineInputBorder(
      borderSide: 3.borderSide(),
    );

    final hintStyle = AppTextStyle.semiBoldStyle.copyWith(
      color: AppColors.doveGray,
      fontSize: Dimens.fontSize14,
    );

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.kPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        color: AppColors.kPrimaryColor,
      ),
      primaryTextTheme: AppTextStyle.textTheme,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.kPrimaryColor,
        height: 45.h,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: 23.borderRadius,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withValues(alpha: .14);
              }

              return null;
            },
          ),
          textStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (_) => AppTextStyle.buttonTextStyle,
          ),
          shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return AppColors.doveGray;
              }
              return null;
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.resolveWith(
            (_) => EdgeInsets.zero,
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.pressed)) {
                return Colors.white.withValues(alpha: .14);
              }

              return null;
            },
          ),
          textStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (_) => AppTextStyle.buttonTextStyle,
          ),
          shape: WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 10.borderRadius,
            ),
          ),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: AppColors.kPrimaryColor,
      ),
      textTheme: TextTheme(
        titleMedium: AppTextStyle.regularStyle.copyWith(
          color: AppColors.mineShaft,
          fontSize: Dimens.fontSize14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        prefixStyle: AppTextStyle.regularStyle.copyWith(
          fontSize: Dimens.fontSize14,
          color: AppColors.black,
        ),
        hintStyle: hintStyle,
        labelStyle: hintStyle,
        enabledBorder: inputBorder,
        disabledBorder: inputBorder,
        focusedBorder: inputBorder,
        border: inputBorder,
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.85),
        shape: RoundedRectangleBorder(
          borderRadius: 10.borderRadius,
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: 20.borderRadius,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(23.r),
            topRight: Radius.circular(23.r),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.kPrimaryColor,
      ),
    );
  }
}
