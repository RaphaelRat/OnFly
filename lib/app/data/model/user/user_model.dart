class User {
  String nome;
  String email;
  String senha;
  int quantidadeDrone;
  String foto;

  User({
    required this.nome,
    required this.email,
    required this.senha,
    required this.quantidadeDrone,
    required this.foto,
  });

  User copyWith({
    String? nome,
    String? email,
    String? senha,
    int? quantidadeDrone,
    String? foto,
  }) {
    return User(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      quantidadeDrone: quantidadeDrone ?? this.quantidadeDrone,
      foto: foto ?? this.foto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
      'quantidadeDrone': quantidadeDrone,
      'foto': foto,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      nome: map['nome'] ?? '',
      email: map['email'] ?? '',
      senha: map['senha'] ?? '',
      quantidadeDrone: map['quantidadeDrone']?.toInt() ?? 0,
      foto: map['foto'] ?? '',
    );
  }

  @override
  String toString() {
    return 'User(nome: $nome, email: $email, senha: $senha, quantidadeDrone: $quantidadeDrone, foto: $foto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.nome == nome &&
        other.email == email &&
        other.senha == senha &&
        other.quantidadeDrone == quantidadeDrone &&
        other.foto == foto;
  }

  @override
  int get hashCode {
    return nome.hashCode ^ email.hashCode ^ senha.hashCode ^ quantidadeDrone.hashCode ^ foto.hashCode;
  }
}
