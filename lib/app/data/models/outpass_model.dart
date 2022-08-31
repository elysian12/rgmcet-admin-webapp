// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

enum Status { approved, rejected, expired, pending }

class OutpassModel {
  String? reason;
  String? typeOfLeave;
  DateTime? fromDate;
  DateTime? toDate;
  String? fromTime;
  String? toTime;
  Status? status;
  String? qrCode;
  String? address;
  String? proofUrl;
  String? name;
  String? uuid;
  DateTime? exitTime;
  DateTime? entryTime;
  String? studentToken;
  String? wardenToken;
  String? srNo;
  OutpassModel({
    this.reason,
    this.typeOfLeave,
    this.fromDate,
    this.toDate,
    this.fromTime,
    this.toTime,
    this.status,
    this.qrCode,
    this.address,
    this.proofUrl,
    this.name,
    this.uuid,
    this.exitTime,
    this.entryTime,
    this.studentToken,
    this.wardenToken,
    this.srNo,
  });

  static OutpassModel fromSnapShot(DocumentSnapshot snapshot, String srNo) {
    return OutpassModel(
      reason: snapshot['reason'],
      typeOfLeave: snapshot['typeOfLeave'],
      address: snapshot['address'],
      fromDate: DateTime.fromMillisecondsSinceEpoch(snapshot['from']),
      toDate: DateTime.fromMillisecondsSinceEpoch(snapshot['to']),
      fromTime: DateFormat('h:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(snapshot['from'])),
      toTime: DateFormat('h:mm a')
          .format(DateTime.fromMillisecondsSinceEpoch(snapshot['to'])),
      proofUrl: snapshot['proofUrl'],
      qrCode: snapshot['qrCode'],
      status: Status.values.byName(snapshot['status']),
      name: snapshot['name'],
      uuid: snapshot['uuid'],
      wardenToken: snapshot['wardenToken'],
      studentToken: snapshot['studentToken'],
      srNo: srNo,
    );
  }
}
