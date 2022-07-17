class LoginForm {
  final String? email;
  final String? senha;

  LoginForm({
    this.email,
    this.senha,
  });

  LoginForm copyWith({String? email, String? senha}) {
    return LoginForm(
      email: email ?? this.email,
      senha: senha ?? this.senha,
    );
  }
}
