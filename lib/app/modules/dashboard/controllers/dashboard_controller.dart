import 'dart:developer';

import 'package:get/get.dart';
import 'package:rgmcet_admin/app/data/methods/firestore_methods.dart';
import 'package:rgmcet_admin/app/data/models/attendece_model.dart';
import 'package:rgmcet_admin/app/data/models/outpass_model.dart';

class DashboardController extends GetxController {
  //state
  RxBool isLoading = false.obs;
  Rx<List<OutpassModel>> outpassList = Rx<List<OutpassModel>>([]);
  Rx<List<AttendeceModel>> attendeceList = Rx<List<AttendeceModel>>([]);

  //getters
  List<OutpassModel> get outpasses => outpassList.value;
  List<AttendeceModel> get attendences => attendeceList.value;

  //Methods
  FireStoreMethods _fireStoreMethods = FireStoreMethods();

  //functions
  void getOutPass() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    outpassList.bindStream(_fireStoreMethods.getAllOutpass());
    isLoading.value = false;
  }

  void getAttendece() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 1));
    attendeceList.bindStream(_fireStoreMethods.getAllAttendece());
    isLoading.value = false;
  }

  @override
  void onInit() {
    getOutPass();
    getAttendece();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
