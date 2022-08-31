import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rgmcet_admin/app/common/constants/colors.dart';
import 'package:rgmcet_admin/app/common/constants/helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rgmcet_admin/app/common/widgets/custom_button.dart';
import 'package:rgmcet_admin/app/common/widgets/loading_overlay.dart';

import '../controllers/login_controller.dart';
import 'helper.dart';

class OtpView extends GetView<LoginController> {
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
                        AuthHelper.verifyOtp,
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                              color: AppColors.labelColor,
                            ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: Text(
                          'Enter OTP sent to your mobile number',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 80.w),
                        child: PinCodeTextField(
                          length: 6,
                          obscureText: false,
                          cursorColor: AppColors.hintColor,
                          cursorHeight: 20,
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 53.h,
                            fieldWidth: 50.h,
                            activeFillColor: Colors.white,
                            activeColor: AppColors.hintColor,
                            selectedColor: AppColors.hintColor,
                            inactiveColor: AppColors.hintColor,
                          ),
                          onChanged: (value) {
                            controller.otpCode = value;
                          },
                          appContext: context,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomButton(
                          label: AuthHelper.verify,
                          onTap: () {
                            controller.verifyOTP(controller.otpCode, context);
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
