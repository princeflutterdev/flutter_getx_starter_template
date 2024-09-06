import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';

import 'custom_text_button.dart';

class CustomRetryWidget extends StatelessWidget {
  final String error;
  final VoidCallback onPressed;

  const CustomRetryWidget({
    super.key,
    required this.onPressed,
    this.error = Strings.somethingWentWrong,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error),
          SizedBox(height: 16.h),
          CustomTextButton(
            buttonWidth: 85.w,
            height: 45,
            onPressed: onPressed,
            title: Strings.retry,
          ),
        ],
      ),
    );
  }
}
