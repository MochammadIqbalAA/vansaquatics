import 'package:get/get.dart';

import '../controllers/report_problem_controller.dart';

class ReportProblemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportProblemController>(
      () => ReportProblemController(),
    );
  }
}
