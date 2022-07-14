class User {
  String email;
  String senha;
  String nome;
  String nomeRestaurante;
  User({
    required this.email,
    required this.senha,
    required this.nome,
    required this.nomeRestaurante,
  });

  User copyWith({
    String? email,
    String? senha,
    String? nome,
    String? nomeRestaurante,
  }) {
    return User(
      email: email ?? this.email,
      senha: senha ?? this.senha,
      nome: nome ?? this.nome,
      nomeRestaurante: nomeRestaurante ?? this.nomeRestaurante,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'senha': senha,
      'nome': nome,
      'nomeRestaurante': nomeRestaurante,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
      nome: map['nome'] ?? '',
      nomeRestaurante: map['nomeRestaurante'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(email: $email, senha: $senha, nome: $nome, nomeRestaurante: $nomeRestaurante)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.email == email && other.senha == senha && other.nome == nome && other.nomeRestaurante == nomeRestaurante;
  }

  @override
  int get hashCode {
    return email.hashCode ^ senha.hashCode ^ nome.hashCode ^ nomeRestaurante.hashCode;
  }
}
