import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/theme/theme.dart';
import './map_controller.dart';

class MapPage extends GetView<MapController> {
  const MapPage({Key? key}) : super(key: key);
  static String route = '/map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Localização'),
          backgroundColor: AppColors.mainColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                transitionOnUserGestures: true,
                tag: 'DroneImage',
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/map.jpg')),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    color: AppColors.whiteSmoke,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                          style:
                              TextStyle(color: AppColors.black, fontSize: 16),
                          text: 'Prazo estimado para entrega: ',
                          children: <TextSpan>[
                        TextSpan(
                            text: ' 6 minutos',
                            style: TextStyle(fontWeight: FontWeight.w700))
                      ])),
                  const SizedBox(height: 16),
                  RichText(
                      text: const TextSpan(
                          style:
                              TextStyle(color: AppColors.black, fontSize: 16),
                          text: 'Gasto estimado do drone: ',
                          children: <TextSpan>[
                        TextSpan(
                            text: ' 80 centavos',
                            style: TextStyle(fontWeight: FontWeight.w700))
                      ])),
                  const SizedBox(height: 16),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              color: AppColors.black, fontSize: 16),
                          text: 'Velocidade do drone: ',
                          children: <TextSpan>[
                        TextSpan(
                            text: ' ${controller.drone.value.velMaxima} km/h',
                            style: const TextStyle(fontWeight: FontWeight.w700))
                      ])),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    child: Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.mainColor))
                            : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              AppColors.mainColor)),
                                  child: const Text('Retornar drone'),
                                  onPressed: controller.voltarDrone,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ));
  }
}
