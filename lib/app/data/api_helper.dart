import 'package:get/get.dart';

export 'package:flutter_getx_starter_template/app/common/util/extensions.dart';
export 'package:flutter_getx_starter_template/app/common/util/utils.dart';

abstract class ApiHelper {
  static ApiHelper get to => Get.find();

  Future<Response> getPosts();
}
