import 'package:dio/dio.dart';
import 'package:schools/core/utils/network/interceptor.dart';
import 'package:schools/data/source/remote/api_key.dart';
import 'package:schools/data/source/remote/model/get_token/request/get_token_request.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiKey.baseUrl,
      receiveDataWhenStatusError: true,
    ));
    dio.interceptors.add(CustomInterceptors());
  }

  static Future<Response> getToken() async {
    return dio.post(ApiKey.getToken,
        data: GetTokenRequest(
          email: "ndannoun@transition-se.com",
          password: "Trans@123",
        ));
  }

  static Future<Response> getTeacherInfo(token) async {
    return dio.get(ApiKey.getTeacherInfo,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> getFatherInfo(token) async {
    return dio.get(ApiKey.getFatherInfo,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> getChildrenByParent(token) async {
    return dio.get(ApiKey.getChildrenByParent,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> getTeacherHome(token) async {
    return dio.get(ApiKey.getTeacherHome,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }));
  }

  static Future<Response> getClassHouses(token, classroomToSectionId) async {
    return dio.get(
        "${ApiKey.getClassHouses}?ClassroomToSectionId=$classroomToSectionId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }

  static Future<Response> getStudentHouses(
      token, classroomToSectionId, houseId) async {
    return dio.get(
        "${ApiKey.getStudentsHouse}?ClassroomToSectionId=$classroomToSectionId&HouseId=$houseId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }
}
