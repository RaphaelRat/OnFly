import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../data/model/drone/drone.dart';
import '../../../data/model/drone/drone_mock.dart';
import '../../drone/drone_page.dart';

Widget droneCard(Drone drone) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: GestureDetector(
      onTap: () => Get.toNamed('${DronePage.route}/${drones.indexOf(drone)}'),
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 56),
                  child: Container(
                    height: 140.0,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.whiteSmoke,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 20,
                          offset: const Offset(-3, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          drone.modelo,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 46),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(color: AppColors.blackSurface),
                                          text: 'Autonomia: ',
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '${drone.autonomia} minutos',
                                              style: const TextStyle(fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(color: AppColors.blackSurface),
                                          text: 'Carga máxima: ',
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: '${drone.cargaMaxima} kg',
                                              style: const TextStyle(fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(color: AppColors.blackSurface),
                                          text: 'Velocidade máxima: ',
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ' ${drone.velMaxima} km/h',
                                              style: const TextStyle(fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0, right: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage(drone.image)),
                      borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          drone.estaNoRadar
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 8, right: 24),
                      child: Icon(
                        Icons.radar,
                        color: AppColors.indigoA700,
                      ),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    ),
  );
}
