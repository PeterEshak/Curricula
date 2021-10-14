import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response<dynamic>> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
    );
  }
    static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    print(dio.toString()); // dioShop.toString()=null
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token?? '',
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
