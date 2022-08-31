import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rgmcet_admin/app/modules/dashboard/views/dashboard_view.dart';
import 'package:rgmcet_admin/app/modules/home/model/side_bar_model.dart';
import 'package:rgmcet_admin/app/modules/home/views/home_view.dart';
import 'package:rgmcet_admin/app/modules/security/views/security_view.dart';
import 'package:rgmcet_admin/app/modules/student/views/student_view.dart';
import 'package:rgmcet_admin/app/modules/warden/views/warden_view.dart';

class HomeController extends GetxController {
  int tabIndex = 0;

  List<SideBarModel> sideBars = [
    SideBarModel(
      label: 'Home',
      icon: 'assets/icons/dashboard.png',
      isSelected: true,
    ),
    SideBarModel(
      label: 'Warden',
      icon: 'assets/icons/warden.png',
      isSelected: false,
    ),
    SideBarModel(
      label: 'Student',
      icon: 'assets/icons/student.png',
      isSelected: false,
    ),
    SideBarModel(
      label: 'Security',
      icon: 'assets/icons/security.png',
      isSelected: false,
    ),
  ];

  List<Widget> pages = [
    DashboardView(),
    WardenView(),
    StudentView(),
    SecurityView()
  ];

  void changePage(int index) {
    for (var i = 0; i < sideBars.length; i++) {
      if (i == index) {
        sideBars[index].isSelected = true;
        tabIndex = index;
      } else {
        sideBars[i].isSelected = false;
      }
    }

    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
