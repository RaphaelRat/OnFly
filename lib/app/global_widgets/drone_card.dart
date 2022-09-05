import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../core/theme/theme.dart';
import '../data/model/drone/drone.dart';
import '../modules/drone/drone_page.dart';

Widget droneCard(Rx<Drone> drone, {bool isDronePage = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Hero(
      transitionOnUserGestures: true,
      tag: 'drone${drones.indexOf(drone.value)}',
      child: GestureDetector(
        onTap: () => isDronePage
            ? imageDialog(drone.value)
            : Get.toNamed(DronePage.route, arguments: drone),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 16.0, left: 56, top: isDronePage ? 20 : 0),
                    child: Container(
                      height: isDronePage ? 80 : 140,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.whiteSmoke,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 20,
                            offset: const Offset(-5, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          isDronePage
                              ? Container()
                              : RichText(
                                  text: TextSpan(
                                    style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    text: drone.value.modelo,
                                  ),
                                ),
                          SizedBox(height: isDronePage ? 0 : 8),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: isDronePage ? 90 : 46),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                color: AppColors.black),
                                            text: 'Autonomia: ',
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${drone.value.autonomia} minutos',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                color: AppColors.black),
                                            text: 'Carga máxima: ',
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    '${drone.value.cargaMaxima} kg',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: const TextStyle(
                                                color: AppColors.black),
                                            text: 'Velocidade máxima: ',
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    ' ${drone.value.velMaxima} km/h',
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.w700),
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
              padding: EdgeInsets.only(top: isDronePage ? 0 : 30.0, right: 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 16),
                    child: Container(
                      width: isDronePage ? 120 : 80,
                      height: isDronePage ? 120 : 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(drone.value.image)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        border: Border.all(color: AppColors.whiteSmoke),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => drone.value.estaNoRadar
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: isDronePage ? 28 : 8, right: 24),
                        child: const Icon(
                          Icons.radar,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  )
                : Container()),
          ],
        ),
      ),
    ),
  );
}

void imageDialog(Drone drone) {
  Get.defaultDialog(
      content: Image.asset(drone.image),
      title: '',
      cancel: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 12),
        child: TextButton(child: const Text('Fechar'), onPressed: Get.back),
      ));
}
