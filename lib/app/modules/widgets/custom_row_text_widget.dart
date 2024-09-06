import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';

class CustomRowTextWidget extends StatelessWidget {
  final String title, subtitle;
  final TextStyle? titleStyle, subtitleStyle;
  final MainAxisAlignment mainAxisAlignment;

  const CustomRowTextWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          maxLines: 1,
          style: titleStyle ??
              AppTextStyle.regularStyle.copyWith(
                color: AppColors.mineShaft,
              ),
        ),
        Text(
          subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: subtitleStyle ??
              AppTextStyle.regularStyle.copyWith(
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
