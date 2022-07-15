import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onfly/app/data/model/drone/drone.dart';
import 'package:onfly/app/data/model/drone/drone_mock.dart';

import '../drone/drone_controller.dart';

class DronePage extends GetView<DroneController> {
  const DronePage({Key? key}) : super(key: key);
  static String route = '/drone';

  @override
  Widget build(BuildContext context) {
    String? id = Get.parameters['id'];
    Drone drone = drones.elementAt(int.parse(id ?? '0'));
    return Scaffold(
      appBar: AppBar(title: const Text('Drone Page')),
      body: Center(
        child: Text('id $id\n${drone.modelo}'),
      ),
    );
  }
}
