import './user_model.dart';

final userRaphael = User(
  email: 'raphael@gmail.com',
  senha: '123123',
  nome: 'Raphael Abreu',
  quantidadeDrone: 4,
  foto: 'assets/images/raphael.jpg',
);
final userNicolas = User(
  email: 'nicolas@gmail.com',
  senha: '123123',
  nome: 'Nícolas Baümle',
  quantidadeDrone: 6,
  foto: 'assets/images/nicolas.jpg',
);
final userMatheus = User(
  email: 'matheus@gmail.com',
  senha: '123123',
  nome: 'Matheus Kolln',
  quantidadeDrone: 2,
  foto: 'assets/images/matheus.jpg',
);

final users = [
  userRaphael,
  userNicolas,
  userMatheus,
];
