class EntregaForm {
  final String? partida;
  final String? chegada;
  final String? conteudo;
  final String? peso;

  EntregaForm({
    this.partida,
    this.chegada,
    this.conteudo,
    this.peso,
  });

  EntregaForm copyWith({
    String? partida,
    String? chegada,
    String? conteudo,
    String? peso,
  }) {
    return EntregaForm(
      partida: partida ?? this.partida,
      chegada: chegada ?? this.chegada,
      conteudo: conteudo ?? this.conteudo,
      peso: peso ?? this.peso,
    );
  }
}
