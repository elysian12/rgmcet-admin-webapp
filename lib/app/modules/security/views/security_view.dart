import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/security_controller.dart';

class SecurityView extends GetView<SecurityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SecurityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
