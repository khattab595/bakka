
class ChangeFavoriteModel {
  ChangeFavoriteModel({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory ChangeFavoriteModel.fromJson(Map<String, dynamic> json) =>
      ChangeFavoriteModel(
        status: json["status"],
        message: json["message"],
      );
}
