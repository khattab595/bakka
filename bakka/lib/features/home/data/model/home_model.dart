
import 'package:bakka/features/product/data/model/product_model.dart';

class HomeModel {
  HomeModel({
    required this.status,
    this.message,
    required this.data,
  });

  bool status;
  dynamic message;
  HomeDataModel data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    message: json["message"],
    data: HomeDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class HomeDataModel {
  HomeDataModel({
    required this.banners,
    required this.products,
    required this.ad,
  });

  List<BannerModel> banners;
  List<ProductModel> products;
  String ad;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
    banners: List<BannerModel>.from(json["banners"].map((element) => BannerModel.fromJson(element))),
    products: List<ProductModel>.from(json["products"].map((element) => ProductModel.fromJson(element))),
    ad: json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "ad": ad,
  };
}

class BannerModel {
  BannerModel({
    required this.id,
    required this.image,

  });

  int id;
  String image;


  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

