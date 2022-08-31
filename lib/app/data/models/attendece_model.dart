import 'package:cloud_firestore/cloud_firestore.dart';

class AttendeceModel {
  String? wardenId;
  String? studentId;
  bool isPresent;
  bool isAbsent;
  String? attendeceId;
  String? hostelName;
  String? studentName;
  String? studentProfile;
  String? studentCourse;

  AttendeceModel({
    this.wardenId,
    this.studentId,
    this.isPresent = false,
    this.isAbsent = false,
    this.attendeceId,
    this.hostelName,
    this.studentCourse,
    this.studentName,
    this.studentProfile,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wardenId': wardenId,
      'studentId': studentId,
      'isPresent': isPresent,
      'isAbsent': isAbsent,
      'attendeceId': attendeceId,
      'hostelName': hostelName,
      'studentCourse': studentCourse,
      'studentName': studentName,
      'studentProfile': studentProfile
    };
  }

  factory AttendeceModel.fromMap(Map<String, dynamic> map) {
    return AttendeceModel(
      wardenId: map['wardenId'] != null ? map['wardenId'] as String : null,
      studentId: map['studentId'] != null ? map['studentId'] as String : null,
      hostelName:
          map['hostelName'] != null ? map['hostelName'] as String : null,
      isPresent: map['isPresent'] as bool,
      isAbsent: map['isAbsent'] as bool,
      attendeceId:
          map['attendeceId'] != null ? map['attendeceId'] as String : null,
      studentProfile: map['studentProfile'] != null
          ? map['studentProfile'] as String
          : null,
      studentName:
          map['studentName'] != null ? map['studentName'] as String : null,
      studentCourse:
          map['studentCourse'] != null ? map['studentCourse'] as String : null,
    );
  }

  static AttendeceModel fromSnapShot(DocumentSnapshot snapshot) {
    return AttendeceModel(
      wardenId:
          snapshot['wardenId'] != null ? snapshot['wardenId'] as String : null,
      studentId: snapshot['studentId'] != null
          ? snapshot['studentId'] as String
          : null,
      isPresent: snapshot['isPresent'] as bool,
      isAbsent: snapshot['isAbsent'] as bool,
      attendeceId: snapshot['attendeceId'] != null
          ? snapshot['attendeceId'] as String
          : null,
      studentProfile: snapshot['studentProfile'] != null
          ? snapshot['studentProfile'] as String
          : null,
      studentName: snapshot['studentName'] != null
          ? snapshot['studentName'] as String
          : null,
      studentCourse: snapshot['studentCourse'] != null
          ? snapshot['studentCourse'] as String
          : null,
    );
  }
}
