class User {
  String nome;
  String email;
  String senha;
  int quantidadeDrone;
  User({
    required this.nome,
    required this.email,
    required this.senha,
    required this.quantidadeDrone,
  });

  User copyWith({
    String? nome,
    String? email,
    String? senha,
    int? quantidadeDrone,
  }) {
    return User(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      quantidadeDrone: quantidadeDrone ?? this.quantidadeDrone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'quantidadeDrone': quantidadeDrone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
      quantidadeDrone: map['quantidadeDrone']?.toInt() ?? 0,
    );
  }

  @override
  String toString() {
    return 'User(nome: $nome, email: $email, senha: $senha, quantidadeDrone: $quantidadeDrone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.nome == nome && other.email == email && other.senha == senha && other.quantidadeDrone == quantidadeDrone;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ email.hashCode ^ senha.hashCode ^ quantidadeDrone.hashCode;
  }
}
