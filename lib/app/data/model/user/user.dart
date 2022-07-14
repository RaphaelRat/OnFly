class User {
  String nome;
  String email;
  String senha;
  User({
    required this.nome,
    required this.email,
    required this.senha,
  });

  User copyWith({
    String? nome,
    String? email,
    String? senha,
  }) {
    return User(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
    );
  }

  @override
  String toString() => 'User(nome: $nome, email: $email, senha: $senha)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.nome == nome && other.email == email && other.senha == senha;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode ^ senha.hashCode;
}
