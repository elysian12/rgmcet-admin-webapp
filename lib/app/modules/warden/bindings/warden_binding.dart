import 'package:get/get.dart';

import '../controllers/warden_controller.dart';

class WardenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WardenController>(
      () => WardenController(),
    );
  }
}
