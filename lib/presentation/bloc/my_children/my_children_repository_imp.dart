import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:schools/data/source/local/database_helper.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide_model.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/student_profile_in_school_house.dart';
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
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      List<StudentProfileInSchoolHouseData> students = (await databaseHelper.getParentOfflineData())
          .parentOfflineData
          ?.teacherStudentsSection ??
          [];
      teacherStudentProfileInSchoolHouseResponse.data = students[students.indexWhere((element) => element.studentId == studentId)];
      teacherStudentProfileInSchoolHouseResponse.errorCode = 200;
      teacherStudentProfileInSchoolHouseResponse.errorMessage = "Success";
      state = GetTeacherStudentProfileInSchoolHouseSuccessState(
          response: teacherStudentProfileInSchoolHouseResponse);
    } else {
      try {
        Response response = await DioHelper.getTeacherStudentProfileInSchoolHouse(
            token, studentId);
        teacherStudentProfileInSchoolHouseResponse =
            TeacherStudentProfileInSchoolHouseResponse.fromJson(response.data);
        if (teacherStudentProfileInSchoolHouseResponse.data != null) {
          state = GetTeacherStudentProfileInSchoolHouseSuccessState(
              response: teacherStudentProfileInSchoolHouseResponse);
        }
      } catch (error) {
        state = GetTeacherStudentProfileInSchoolHouseFailState(
            error: teacherStudentProfileInSchoolHouseResponse.errorMessage ??
                "Error");
      }
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
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if (connectivityResult == ConnectivityResult.none) {
      bool isFather = await SharedPreferencesManager.getIsFather() ?? false;
      if(isFather) {
        getTeacherPrinciplByClassroomIdResponse.data = (await databaseHelper.getParentOfflineData()).parentOfflineData?.principlesByClassroomId ?? [];

      } else {
        getTeacherPrinciplByClassroomIdResponse.data = (await databaseHelper.getTeacherOfflineData()).teacherOfflineData?.principlesByClassroomId ?? [];
      }
      getTeacherPrinciplByClassroomIdResponse.errorCode = 200;
      getTeacherPrinciplByClassroomIdResponse.errorMessage = "Success";
      state = GetTeacherPrinciplByClassroomIdSuccessState(
          response: getTeacherPrinciplByClassroomIdResponse);
    } else {
      try {
        Response response =
        await DioHelper.getTeacherPrinciplesByClassroomId(token, classroomId);
        getTeacherPrinciplByClassroomIdResponse =
            GetTeacherPrinciplByClassroomIdResponse.fromJson(response.data);
        if (getTeacherPrinciplByClassroomIdResponse.data != null) {
          state = GetTeacherPrinciplByClassroomIdSuccessState(
              response: getTeacherPrinciplByClassroomIdResponse);
        }
      } catch (error) {
        state = GetTeacherPrinciplByClassroomIdFillState(
            error:
            getTeacherPrinciplByClassroomIdResponse.errorMessage ?? "Error");
      }
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
