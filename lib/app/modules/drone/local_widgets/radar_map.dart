import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/theme.dart';
import '../../../data/model/drone/drone.dart';
import '../../map/map_page.dart';

Widget radarMap(Rx<Drone> drone) {
  final textTheme = Get.textTheme;

  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Drone em uso',
            style: textTheme.headline6?.copyWith(fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        Text('Clique no mapa abaixo para acompanhá-lo',
            style: textTheme.subtitle1?.copyWith(fontWeight: FontWeight.w400)),
        const SizedBox(height: 8),
        Expanded(
          child: GestureDetector(
            onTap: () => Get.toNamed(MapPage.route, arguments: drone),
            child: Hero(
              transitionOnUserGestures: true,
              tag: 'DroneImage',
              child: Container(
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/map.jpg')),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteSmoke,
                  border: Border.all(color: AppColors.mainColor_12, width: 4),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
