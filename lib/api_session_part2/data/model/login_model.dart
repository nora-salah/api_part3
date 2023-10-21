class LoginModel{
  final String massage;
  final String token;

  LoginModel({
    required this.massage,
    required this.token,
  });

  factory LoginModel.fromJson(Map jsonData){
    return LoginModel(massage: jsonData['massage'], token: jsonData['token']);
  }
}