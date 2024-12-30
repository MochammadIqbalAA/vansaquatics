

import 'package:get/get.dart';

import '../controllers/waiting_for_payment_controller.dart';

class WaitingForPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingForPaymentController>(
      () => WaitingForPaymentController(),
    );
  }
}
