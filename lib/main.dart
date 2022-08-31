import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:rgmcet_admin/app/common/constants/theme.dart';
import 'package:rgmcet_admin/app/data/services/shared_service.dart';
import 'package:rgmcet_admin/app/modules/login/bindings/login_binding.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: 'AIzaSyDfXdI0Wf2xb9YVqe3Dsq6FYZZ1Fc2yEqI',
    appId: '1:995787558926:web:167220bcf93422db9cec5f',
    messagingSenderId: '995787558926',
    projectId: 'rgmcet-21ea4',
  ));

  bool isLoggedIn = await SharedService().getSharedUUID() == null;
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: appTheme(),
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                theme: appTheme(),
                title: "RGMCET-Student",
                initialRoute: isLoggedIn ? Routes.HOME : Routes.LOGIN,
                getPages: AppPages.routes,
                initialBinding: LoginBinding(),
              ),
            );
          },
        );
      },
    );
  }
}
