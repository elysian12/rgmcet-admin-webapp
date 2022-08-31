import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rgmcet_admin/app/data/models/attendece_model.dart';
import 'package:rgmcet_admin/app/data/models/outpass_model.dart';

class FireStoreMethods {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> checkUser(User user) async {
    var res = false;
    try {
      var result =
          await _firebaseFirestore.collection('admin').doc(user.uid).get();
      if (result.exists) {
        res = true;
      } else {
        res = false;
      }
    } on FirebaseException catch (e) {
      log(e.message!);
      res = false;
    }

    return res;
  }

  Stream<List<OutpassModel>> getAllOutpass() {
    return _firebaseFirestore
        .collection('outpasses')
        .snapshots()
        .map((outpassList) {
      log(outpassList.docs.length.toString());
      List<OutpassModel> outpasses = [];

      for (var i = 0; i < outpassList.docs.length; i++) {
        outpasses.add(
          OutpassModel.fromSnapShot(outpassList.docs[i], (i + 1).toString()),
        );
      }
      return outpasses;
    });
  }

  Stream<List<AttendeceModel>> getAllAttendece() {
    return _firebaseFirestore.collection('attendence').snapshots().map((doc) {
      List<AttendeceModel> attendence = [];

      for (var i = 0; i < doc.docs.length; i++) {
        var docRes = doc.docs[i];

        var list = List<AttendeceModel>.from((docRes['attendence'] as List)
            .map((e) => AttendeceModel.fromMap(e)));

        list.forEach((element) {
          attendence.add(element);
        });
      }

      log('@@@ length of attendece ${attendence.length}');

      return attendence;
    });
  }
}
