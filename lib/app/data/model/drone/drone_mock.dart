import './drone.dart';

final drone1Mock = Drone(
  modelo: 'Aurelia X6 Standard',
  velMaxima: 56,
  autonomia: 30,
  cargaMaxima: 5,
  image: 'assets/images/drone1.jpg',
  estaNoRadar: true,
);
final drone2Mock = Drone(
  modelo: 'Drone xyz forte',
  velMaxima: 12,
  autonomia: 32,
  cargaMaxima: 25,
  image: 'assets/images/drone2.webp',
  estaNoRadar: false,
);
final drone3Mock = Drone(
  modelo: 'Drone xyz rapido',
  velMaxima: 135,
  autonomia: 12,
  cargaMaxima: 2,
  image: 'assets/images/drone3.jpg',
  estaNoRadar: true,
);
final drone4Mock = Drone(
  modelo: 'Imperador valente',
  velMaxima: 41,
  autonomia: 60,
  cargaMaxima: 10,
  image: 'assets/images/drone4.webp',
  estaNoRadar: false,
);
final drone5Mock = Drone(
  modelo: 'Urubu de carga',
  velMaxima: 30,
  autonomia: 30,
  cargaMaxima: 8,
  image: 'assets/images/drone5.webp',
  estaNoRadar: false,
);
final drone6Mock = Drone(
  modelo: 'Disco voador',
  velMaxima: 30,
  autonomia: 30,
  cargaMaxima: 8,
  image: 'assets/images/drone6.jpg',
  estaNoRadar: true,
);

List drones = [
  drone1Mock,
  drone2Mock,
  drone3Mock,
  drone4Mock,
  drone5Mock,
  drone6Mock,
];
