class EntregaForm {
  final String? partida;
  final String? chegada;
  final String? conteudo;

  EntregaForm({
    this.partida,
    this.chegada,
    this.conteudo,
  });

  EntregaForm copyWith({
    String? partida,
    String? chegada,
    String? conteudo,
  }) {
    return EntregaForm(
      partida: partida ?? this.partida,
      chegada: chegada ?? this.chegada,
      conteudo: conteudo ?? this.conteudo,
    );
  }
}
