import 'package:get/get.dart';

import '../controllers/addfriend_controller.dart';

class AddfriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddfriendController>(
      () => AddfriendController(),
    );
  }
}
