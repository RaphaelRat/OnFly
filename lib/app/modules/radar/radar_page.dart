import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/app_colors.dart';
import './radar_controller.dart';

class RadarPage extends GetView<RadarController> {
  const RadarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.almostWhite,
      child: Center(
        child: Text(
          controller.text,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
