import 'package:dio/dio.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide_model.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/data/source/remote/repository/my_children_repository.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';

class MyChildrenRepositoryImp extends BaseMyChildrenRepository {
  @override
  Future<MyChildrenState> getTeacherStudentProfileInSchoolHouse(
      String token, String studentId) async {
    MyChildrenState? state;
    TeacherStudentProfileInSchoolHouseResponse
        teacherStudentProfileInSchoolHouseResponse =
        TeacherStudentProfileInSchoolHouseResponse();
    try {
      Response response = await DioHelper.getTeacherStudentProfileInSchoolHouse(
          token, studentId);
      teacherStudentProfileInSchoolHouseResponse =
          TeacherStudentProfileInSchoolHouseResponse.fromJson(response.data);
      if (teacherStudentProfileInSchoolHouseResponse.data != null) {
        return GetTeacherStudentProfileInSchoolHouseSuccessState(
            response: teacherStudentProfileInSchoolHouseResponse);
      }
    } catch (error) {
      state = GetTeacherStudentProfileInSchoolHouseFailState(
          error: teacherStudentProfileInSchoolHouseResponse.errorMessage ??
              "Error");
    }
    return state!;
  }

  @override
  Future<MyChildrenState> getTeacherPrincipleByClassroomId(
      String token, String classroomId) async {
    MyChildrenState? state;
    GetTeacherPrinciplByClassroomIdResponse
        getTeacherPrinciplByClassroomIdResponse =
        GetTeacherPrinciplByClassroomIdResponse();
    try {
      Response response =
          await DioHelper.getTeacherPrinciplesByClassroomId(token, classroomId);
      getTeacherPrinciplByClassroomIdResponse =
          GetTeacherPrinciplByClassroomIdResponse.fromJson(response.data);
      if (getTeacherPrinciplByClassroomIdResponse.data != null) {
        return GetTeacherPrinciplByClassroomIdSuccessState(
            response: getTeacherPrinciplByClassroomIdResponse);
      }
    } catch (error) {
      state = GetTeacherPrinciplByClassroomIdFillState(
          error:
              getTeacherPrinciplByClassroomIdResponse.errorMessage ?? "Error");
    }
    return state!;
  }

  @override
  Future<MyChildrenState> getGuides(String branchId, bool language) async {
    String token = await SharedPreferencesManager.getTokenDio() ?? "";
    Response response = await DioHelper.getGuides(
      branchId,
      token,
    );
    GuideModel guideModel = GuideModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return GetGuidesSuccessState(guides: guideModel.guides!);
    } else {
      return GetGuidesErrorState(errorMessage: guideModel.errorMessage!);
    }
  }
}
