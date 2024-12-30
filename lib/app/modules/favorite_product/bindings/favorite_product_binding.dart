import 'package:get/get.dart';

import '../controllers/favorite_product_controller.dart';

class FavoriteProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteProductController>(
      () => FavoriteProductController(),
    );
  }
}
