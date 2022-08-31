import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rgmcet_admin/app/common/constants/colors.dart';

import 'package:rgmcet_admin/app/common/constants/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rgmcet_admin/app/common/constants/text_styles.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(10.w),
          child: Image.asset(Helper.logo),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(
              right: 20.w,
              left: 10.h,
            ),
            onPressed: () {},
            icon: Image.asset(Helper.profile),
          )
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border(
                    right: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                    top: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  )),
              child: GetBuilder<HomeController>(builder: (_) {
                return Column(
                    children:
                        List.generate(controller.sideBars.length, (index) {
                  var sidebar = controller.sideBars[index];
                  return InkWell(
                    onTap: () {
                      controller.changePage(index);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: sidebar.isSelected
                            ? AppColors.primaryColor
                            : Colors.transparent,
                        border: Border(
                            bottom: BorderSide(color: AppColors.primaryColor)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40.w,
                          ),
                          Image.asset(
                            sidebar.icon,
                            scale: 6,
                            color: sidebar.isSelected
                                ? AppColors.whiteColor
                                : AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Text(
                            sidebar.label,
                            style: MyTextStyle.buttonStyle.copyWith(
                              color: sidebar.isSelected
                                  ? AppColors.whiteColor
                                  : AppColors.primaryColor,
                              fontSize: 18.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
              }),
            ),
          ),
          Expanded(
            flex: 5,
            child: GetBuilder<HomeController>(builder: (context) {
              return controller.pages[controller.tabIndex];
            }),
          ),
        ],
      ),
    );
  }
}
