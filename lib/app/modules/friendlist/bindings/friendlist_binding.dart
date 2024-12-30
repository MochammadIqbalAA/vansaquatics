import 'package:get/get.dart';

import '../controllers/friendlist_controller.dart';

class FriendlistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendlistController>(
      () => FriendlistController(),
    );
  }
}
