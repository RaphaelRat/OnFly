import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './radar_controller.dart';

class RadarPage extends GetView<RadarController> {
  const RadarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(controller.text),
    );
  }
}
