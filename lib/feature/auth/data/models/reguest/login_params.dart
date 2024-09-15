class LoginParames {
  String? email;
  String? password;

  LoginParames({this.email, this.password});

  Map<String, dynamic> tojson() => {
        'email': email,
        'password': password,
      };
}
