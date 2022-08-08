
class CategoriesModel {
  CategoriesModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  CategoriesDataModel data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    status: json["status"],
    message: json["message"],
    data: CategoriesDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class CategoriesDataModel {
  CategoriesDataModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required  this.from,
    required  this.lastPage,
    required this.lastPageUrl,
    this.nextPageUrl,
    required  this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<DatModel> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) => CategoriesDataModel(
    currentPage: json["current_page"],
    data: List<DatModel>.from(json["data"].map((x) => DatModel.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class DatModel {
  DatModel({
    required this.id,
    required  this.name,
    required  this.image,
  });

  int id;
  String name;
  String image;

  factory DatModel.fromJson(Map<String, dynamic> json) => DatModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
