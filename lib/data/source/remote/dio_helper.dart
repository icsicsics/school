import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/core/utils/network/interceptor.dart';
import 'package:schools/data/source/remote/api_key.dart';
import 'package:schools/data/source/remote/model/father_point/request/father_add_point_request.dart';
import 'package:schools/data/source/remote/model/get_token/request/get_token_request.dart';
import 'package:schools/data/source/remote/model/teacher_point/request/teacher_add_point_request.dart';

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

  static Future<Response> getClassHouses(
      token, classroomToSectionId, isComingFromHome) async {
    return dio.get(
        isComingFromHome==false
            ? "${ApiKey.getClassHouses}?ClassroomToSectionId=$classroomToSectionId"
            : "${ApiKey.getSchoolHouses}?BranchId=$classroomToSectionId",
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

  static Future<Response> getStudentsProfileByTeacher(token, studentId) async {
    return dio.get("${ApiKey.getStudentsProfileByTeacher}?StudentId=$studentId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }

  static Future<Response> getTeacherPrinciplesByClassroomId(
      token, classRoom) async {
    return dio.get(
        "${ApiKey.getTeacherPrinciplesByClassroomId}?ClassroomId=$classRoom",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }

  static Future<Response> getTeacherStudentProfileInSchoolHouse(
      token, studentId) async {
    return dio.get(
        "${ApiKey.getTeacherStudentProfileInSchoolHouse}?StudentId=$studentId",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }

  static Future<Response> postTeacherCreatePoint(
      token, TeacherAddPointRequest request) async {
    return dio.post(ApiKey.postTeacherCreatePoint,
        data: request,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }

  static Future<Response> postFatherCreatePoint(
      token, FatherAddPointRequest request) async {
    return dio.post(ApiKey.postFatherCreatePoint,
        data: request,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));
  }

  static Future<Response> teacherChangePhoto(token, FormData formData) async {
    return dio.post(ApiKey.teacherChangePhoto,
        data: formData,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "accept": "text/plain",
            "Content-Type": "multipart/form-data",
            "Authorization": "Bearer $token",
          },
        ));
  }
}
