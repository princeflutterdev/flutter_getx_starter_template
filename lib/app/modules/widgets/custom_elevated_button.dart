import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';

class CustomElevatedButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double height, minWidth;
  final Widget? titleWidget;
  final Color buttonColor;
  final bool addBorder;

  const CustomElevatedButton({
    super.key,
    this.title,
    required this.onPressed,
    this.textStyle,
    this.height = 52,
    this.minWidth = 100,
    this.buttonColor = AppColors.kPrimaryColor,
    this.titleWidget,
    this.addBorder = false,
  }) : assert(
          title == null || titleWidget == null,
          'Cannot provide both a title and a child\n'
          'To provide both, use "titleWidget: Text(title)".',
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.resolveWith<Size>(
          (states) => Size(
            minWidth.w,
            height.h,
          ),
        ),
        shape: addBorder
            ? WidgetStateProperty.resolveWith<RoundedRectangleBorder>(
                (states) => RoundedRectangleBorder(
                  borderRadius: 10.borderRadius,
                  side: BorderSide(
                    color: buttonColor == AppColors.kPrimaryColor
                        ? Colors.white
                        : AppColors.kPrimaryColor,
                    width: 2.w,
                  ),
                ),
              )
            : AppTheme.theme.textButtonTheme.style!.shape,
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
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.doveGray;
            }
            return buttonColor;
          },
        ),
      ),
      child: titleWidget ??
          Text(
            title!,
            style: textStyle ??
                AppTextStyle.boldStyle.copyWith(
                  fontSize: Dimens.fontSize14,
                  color: buttonColor == Colors.white ||
                          buttonColor == Colors.transparent
                      ? AppColors.kPrimaryColor
                      : Colors.white,
                ),
          ),
    );
  }
}
