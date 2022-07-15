class Drone {
  String modelo;
  int velMaxima;
  int autonomia;
  int cargaMaxima;
  String image;
  bool estaNoRadar;
  Drone({
    required this.modelo,
    required this.velMaxima,
    required this.autonomia,
    required this.cargaMaxima,
    required this.image,
    required this.estaNoRadar,
  });

  Drone copyWith({
    String? modelo,
    int? velMaxima,
    int? autonomia,
    int? cargaMaxima,
    String? image,
    bool? estaNoRadar,
  }) {
    return Drone(
      modelo: modelo ?? this.modelo,
      velMaxima: velMaxima ?? this.velMaxima,
      autonomia: autonomia ?? this.autonomia,
      cargaMaxima: cargaMaxima ?? this.cargaMaxima,
      image: image ?? this.image,
      estaNoRadar: estaNoRadar ?? this.estaNoRadar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'modelo': modelo,
      'velMaxima': velMaxima,
      'autonomia': autonomia,
      'cargaMaxima': cargaMaxima,
      'image': image,
      'estaNoRadar': estaNoRadar,
    };
  }

  factory Drone.fromMap(Map<String, dynamic> map) {
    return Drone(
      modelo: map['modelo'] ?? '',
      velMaxima: map['velMaxima']?.toInt() ?? 0,
      autonomia: map['autonomia']?.toInt() ?? 0,
      cargaMaxima: map['cargaMaxima']?.toInt() ?? 0,
      image: map['image'] ?? '',
      estaNoRadar: map['estaNoRadar'] ?? false,
    );
  }

  @override
  String toString() {
    return 'Drone(modelo: $modelo, velMaxima: $velMaxima, autonomia: $autonomia, cargaMaxima: $cargaMaxima, image: $image, estaNoRadar: $estaNoRadar)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Drone &&
        other.modelo == modelo &&
        other.velMaxima == velMaxima &&
        other.autonomia == autonomia &&
        other.cargaMaxima == cargaMaxima &&
        other.image == image &&
        other.estaNoRadar == estaNoRadar;
  }

  @override
  int get hashCode {
    return modelo.hashCode ^ velMaxima.hashCode ^ autonomia.hashCode ^ cargaMaxima.hashCode ^ image.hashCode ^ estaNoRadar.hashCode;
  }
}
