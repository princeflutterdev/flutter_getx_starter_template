import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';
import 'package:get/get.dart';

class CustomInkwellWidget extends Material {
  CustomInkwellWidget({
    super.key,
    required Function() onTap,
    required Widget child,
  }) : super(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: AppColors.kPrimaryColor.withValues(alpha: 0.24),
            child: child.paddingAll(8),
          ),
        );

  CustomInkwellWidget.text({
    super.key,
    required Function() onTap,
    required String title,
    TextStyle? textStyle,
    Color? textColor,
    double? textSize,
  })  : assert(
          textColor == null || textStyle == null,
          'Cannot provide both a textColor and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(color: color)".',
        ),
        assert(
          textSize == null || textStyle == null,
          'Cannot provide both a textSize and a textStyle\n'
          'To provide both, use "textStyle: TextStyle(size: textSize)".',
        ),
        super(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Text(
              title,
              style: textStyle ??
                  AppTextStyle.regularStyle.copyWith(
                    color: textColor,
                    fontSize: textSize,
                  ),
            ).paddingAll(8),
          ),
        );
}
