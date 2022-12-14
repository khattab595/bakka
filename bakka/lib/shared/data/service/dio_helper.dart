import 'package:bakka/shared/core/url_manage.dart';
import 'package:dio/dio.dart';



class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: AppUrl.baseUrl,
          receiveDataWhenStatusError: true,
        ),
    );
  }

  // get data

  static Future<Response> getData({
    required String url,
      Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      'Content-Type': "application/json",
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      'Content-Type': "application/json",
    };
    return await dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  static Future<Response> putData({
    required String url,
    String lang = 'en',
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": token,
      'Content-Type': "application/json",
    };
    return await dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
