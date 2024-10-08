import 'package:flutter/material.dart';
import 'package:flutter_getx_starter_template/app/common/util/exports.dart';
import 'package:flutter_getx_starter_template/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_starter_template/app/modules/widgets/base_widget.dart';
import 'package:flutter_getx_starter_template/app/modules/widgets/custom_appbar_widget.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(
        addBackButton: false,
        title: Strings.home,
      ),
      body: Obx(
        () {
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10.h),
            itemCount: controller.dataList.length,
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final dynamic data = controller.dataList[index];

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title: ${data['title'].toString()}',
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Body: ${data['body'].toString()}',
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
