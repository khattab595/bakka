class ChangeCartModel {
  ChangeCartModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory ChangeCartModel.fromJson(Map<String, dynamic> json) =>
      ChangeCartModel(
        status: json["status"],
        message: json["message"],
      );
}