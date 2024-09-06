import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final double height;
  final double? buttonWidth, textFontSize;
  final Widget? child;
  final Color buttonColor;
  final bool addBorder;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    this.title,
    this.height = 52,
    this.child,
    this.buttonColor = AppColors.kPrimaryColor,
    this.buttonWidth,
    this.textFontSize,
    this.addBorder = false,
  }) : assert(
          title == null || child == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "child: Text(title)".',
        );

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: AppTheme.theme.textButtonTheme.style!.copyWith(
        minimumSize: WidgetStateProperty.resolveWith<Size>(
          (states) => buttonWidth == null
              ? Size.fromHeight(height.h)
              : Size(
                  buttonWidth!,
                  height.h,
                ),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return buttonColor == Colors.transparent ||
                      buttonColor == Colors.white
                  ? AppColors.kPrimaryColor.withOpacity(.24)
                  : Colors.white.withOpacity(.14);
            }

            return null;
          },
        ),
        shape: addBorder
            ? WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: 23.borderRadius,
                  side: BorderSide(
                    color: buttonColor == AppColors.kPrimaryColor
                        ? Colors.white
                        : AppColors.kPrimaryColor,
                    width: 2.w,
                  ),
                ),
              )
            : AppTheme.theme.textButtonTheme.style!.shape,
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.doveGray;
            }

            return buttonColor;
          },
        ),
      ),
      child: child ??
          Text(
            title!,
            style: AppTextStyle.buttonTextStyle.copyWith(
              fontSize: textFontSize ?? Dimens.fontSize16,
              color: buttonColor == Colors.white ||
                      buttonColor == Colors.transparent
                  ? AppColors.kPrimaryColor
                  : Colors.white,
            ),
          ),
    );
  }
}
