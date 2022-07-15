import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onfly/app/modules/drone/drone_controller.dart';

class DronePage extends GetView<DroneController> {
  const DronePage({Key? key}) : super(key: key);
  static String route = '/drone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drone Page')),
      body: Center(
        child: Text(controller.text),
      ),
    );
  }
}
