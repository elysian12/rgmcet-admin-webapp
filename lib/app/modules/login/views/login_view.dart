import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rgmcet_admin/app/common/constants/colors.dart';
import 'package:rgmcet_admin/app/common/constants/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rgmcet_admin/app/common/widgets/custom_button.dart';
import 'package:rgmcet_admin/app/common/widgets/custom_textfield.dart';
import 'package:rgmcet_admin/app/common/widgets/loading_overlay.dart';

import '../controllers/login_controller.dart';
import 'helper.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingOverlay(
        isLoading: controller.isLoading,
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              Spacer(
                flex: 1,
              ),
              Image.asset(
                Helper.logo,
                scale: 4,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                AuthHelper.welcome,
                style: Theme.of(context).textTheme.headline2,
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                height: 400.h,
                width: 650.w,
                decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      offset: Offset(0.8, 1),
                      color: AppColors.primaryColor.withOpacity(0.5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 21.h,
                      ),
                      Text(
                        AuthHelper.login,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: AppColors.labelColor,
                            ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 100.w),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis.',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                        children: [
                          Text(
                            AuthHelper.mobile,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      CustomTextField(
                        controller: controller.mobileController,
                        hintText: AuthHelper.mobile,
                        onChanged: (value) {
                          if (value.length >= 10) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomButton(
                          label: AuthHelper.otp,
                          onTap: () {
                            controller.sendOTP(
                                controller.mobileController.text, context);
                          }),
                    ],
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
