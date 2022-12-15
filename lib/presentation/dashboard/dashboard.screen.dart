import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'controllers/dashboard.controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.preferences();

    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardScreen'),
        centerTitle: true,
      ),
      body: Container(
          child: ElevatedButton(
              onPressed: () {
                controller.logout();
              },
              child: "Logout".text.bold.make())),
    );
  }
}
