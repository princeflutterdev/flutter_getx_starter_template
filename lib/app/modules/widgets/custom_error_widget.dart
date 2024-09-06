import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';
import 'package:get/get.dart';

class CustomErrorWidget extends StatelessWidget {
  final String? message;

  const CustomErrorWidget({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          message ?? Strings.somethingWentWrong,
          style: Get.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
