class LoginRequest {
  final String userName;
  final String password;

  const LoginRequest({
    required this.userName,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      userName: json['userName'],
      password: json['password'],
    );
  }
}