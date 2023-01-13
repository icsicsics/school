import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
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
      state =
          GetTeacherHomeFillState(error: getTeacherHomeResponse.errorMessage!);
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
          error: getChildrenByParentResponse.errorMessage!);
    }
    return state!;
  }
}
