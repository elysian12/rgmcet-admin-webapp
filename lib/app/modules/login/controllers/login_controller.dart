import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rgmcet_admin/app/common/utils/utils.dart';
import 'package:rgmcet_admin/app/data/methods/firestore_methods.dart';
import 'package:rgmcet_admin/app/data/services/shared_service.dart';
import 'package:rgmcet_admin/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final TextEditingController mobileController = TextEditingController();

  //INTIAl Value
  String otpCode = '123456';
  String? _verificationId;
  File? file;

  //state
  RxBool isLoading = false.obs;
  bool isSignup = false;

  //Methods
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FireStoreMethods _fireStoreMethods = FireStoreMethods();

  //functions
  void sendOTP(String mobile, BuildContext context) async {
    isLoading.value = true;
    var res = await _auth.signInWithPhoneNumber(
      '+91' + mobile,
    );
    isLoading.value = false;
    Get.toNamed(Routes.OTP);
    _verificationId = res.verificationId;
  }

  void verifyOTP(String otp, BuildContext context) async {
    isLoading.value = true;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );
    signInWithPhone(credential, context);
  }

  void signInWithPhone(
      PhoneAuthCredential credential, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        isLoading.value = false;
        var res = await _fireStoreMethods.checkUser(_auth.currentUser!);
        if (res) {
          mobileController.clear();
          Get.offAllNamed(Routes.HOME);
          SharedService().setSharedUUID(userCredential.user!.uid);
          showSnackBar(context, 'Welcome ${userCredential.user!.uid}');
        } else {
          mobileController.clear();
          showSnackBar(context, 'Your Account is not yet activated !!!');
          Get.offAllNamed(Routes.LOGIN);
        }
      }
    } on FirebaseAuthException catch (ex) {
      isLoading.value = false;
      log(ex.message!);
      showSnackBar(context, ex.message!);
    }
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
