import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/repository/home_repository.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';

class HomeRepositoryImp extends BaseHomeRepository {
  @override
  Future<HomeState> getTeacherHome(String token) async {
    HomeState? state;
    GetTeacherHomeResponse getTeacherHomeResponse = GetTeacherHomeResponse();
    try {
      Response response = await DioHelper.getTeacherHome(token);
      getTeacherHomeResponse = GetTeacherHomeResponse.fromJson(response.data);
      if (getTeacherHomeResponse.data != null) {
        return GetTeacherHomeSuccessState(response: getTeacherHomeResponse);
      }
    } catch (error) {
      state = GetTeacherHomeFillState(
          error: getTeacherHomeResponse.errorMessage ?? "Error");
    }
    return state!;
  }

  @override
  Future<HomeState> getParentHome(String token) async {
    HomeState? state;
    GetChildrenByParentResponse getChildrenByParentResponse =
        GetChildrenByParentResponse();
    try {
      Response response = await DioHelper.getChildrenByParent(token);
      getChildrenByParentResponse =
          GetChildrenByParentResponse.fromJson(response.data);
      if (getChildrenByParentResponse.data != null) {
        return GetParentHomeSuccessState(response: getChildrenByParentResponse);
      }
    } catch (error) {
      state = GetParentHomeFillState(
          error: getChildrenByParentResponse.errorMessage ?? "Error");
    }
    return state!;
  }

  @override
  Future<HomeState> getFatherInfo(String token) async {
    HomeState? state;
    FatherInfoResponse fatherInfoResponse = FatherInfoResponse();
    try {
      Response response = await DioHelper.getFatherInfo(token);
      fatherInfoResponse = FatherInfoResponse.fromJson(response.data);
      if (fatherInfoResponse.data != null) {
        return GetFatherInfoSuccessState(response: fatherInfoResponse);
      }
    } catch (error) {
      state = GetFatherInfoFillState(
          error: fatherInfoResponse.errorMessage ?? "Error");
    }
    return state!;
  }

  @override
  Future<HomeState> getTeacherInfo(String token) async {
    HomeState? state;
    TeacherInfoResponse teacherInfoResponse = TeacherInfoResponse();
    try {
      Response response = await DioHelper.getTeacherInfo(token);
      teacherInfoResponse = TeacherInfoResponse.fromJson(response.data);
      if (teacherInfoResponse.data != null) {
        return GetTeacherInfoSuccessState(response: teacherInfoResponse);
      }
    } catch (error) {
      state = GetTeacherInfoFillState(
          error: teacherInfoResponse.errorMessage ?? "Error");
    }
    return state!;
  }
}
