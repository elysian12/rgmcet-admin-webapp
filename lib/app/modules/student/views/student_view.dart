import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/student_controller.dart';

class StudentView extends GetView<StudentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'StudentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
