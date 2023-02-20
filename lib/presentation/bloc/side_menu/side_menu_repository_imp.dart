import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/repository/side_menu_repository.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';

class SideMenuRepositoryImp extends BaseSideMenuRepository {
  @override
  Future<SideMenuState> getTeacherInfo(String token) async {
    SideMenuState? state;
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

  @override
  Future<SideMenuState> getFatherInfo(String token) async {
    SideMenuState? state;
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
}
