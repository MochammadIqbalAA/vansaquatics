import 'package:get/get.dart';

import '../controllers/myorder_controller.dart';

class MyorderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyorderController>(
      () => MyorderController(),
    );
  }
}
