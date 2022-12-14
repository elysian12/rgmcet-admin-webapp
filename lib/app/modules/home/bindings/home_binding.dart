import 'package:get/get.dart';
import 'package:rgmcet_admin/app/modules/dashboard/controllers/dashboard_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.put(DashboardController());
  }
}
