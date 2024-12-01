class RegisterModel{
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> getMap() {
    return {
      'username': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}