class LoginModel {
  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  UserData  data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
      this.image,
      this.points,
      this.credit,
    required this.token,
  });

  int id;
  String name;
  String email;
  String phone;
  String? image;
  int? points;
  int? credit;
  String token;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        credit: json["credit"],
        token: json["token"],
      );
}
