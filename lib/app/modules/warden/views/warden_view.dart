import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/warden_controller.dart';

class WardenView extends GetView<WardenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'WardenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
