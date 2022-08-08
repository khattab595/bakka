
class SettingsModel {
  SettingsModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  Data data;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.about,
    required this.terms,
  });

  String about;
  String terms;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        about: json["about"],
        terms: json["terms"],
      );

  Map<String, dynamic> toJson() => {
        "about": about,
        "terms": terms,
      };
}
