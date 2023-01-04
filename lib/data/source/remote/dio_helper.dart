import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/api_key.dart';
import 'package:schools/data/source/remote/model/get_token/request/get_token_request.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiKey.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getToken() async {
    return dio.post(ApiKey.getToken,
        data: GetTokenRequest(
          email: "ndannoun@transition-se.com",
          password:"Trans@123",
        ));
  }
}