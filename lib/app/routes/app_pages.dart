import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login/views/otp_view.dart';
import '../modules/security/bindings/security_binding.dart';
import '../modules/security/views/security_view.dart';
import '../modules/student/bindings/student_binding.dart';
import '../modules/student/views/student_view.dart';
import '../modules/warden/bindings/warden_binding.dart';
import '../modules/warden/views/warden_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.WARDEN,
      page: () => WardenView(),
      binding: WardenBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT,
      page: () => StudentView(),
      binding: StudentBinding(),
    ),
    GetPage(
      name: _Paths.SECURITY,
      page: () => SecurityView(),
      binding: SecurityBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
