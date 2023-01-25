import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/teacher_point/request/teacher_add_point_request.dart';
import 'package:schools/data/source/remote/model/teacher_point/response/teacher_add_point_response.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/repository/teacher_principl_by_classroomId_repository.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';

class TeacherPrincipleByClassroomIdRepositoryImp
    extends BaseTeacherPrincipleByClassroomIdRepository {
  @override
  Future<AddPointState> getTeacherPrincipleByClassroomId(
      String token, String classroomId) async {
    AddPointState? state;
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
  Future<AddPointState> postTeacherAddPoint(
      String token, TeacherAddPointRequest request) async {
    AddPointState? state;
    TeacherAddPointResponse teacherAddPointResponse = TeacherAddPointResponse();
    try {
      Response response =
          await DioHelper.postTeacherCreatePoint(token, request);
      teacherAddPointResponse = TeacherAddPointResponse.fromJson(response.data);
      if (teacherAddPointResponse.data != null) {
        return PostTeacherCreatePointSuccessState(
            response: teacherAddPointResponse);
      } else {
        return PostTeacherCreatePointFailState(
            error: teacherAddPointResponse.errorMessage ?? "");
      }
    } catch (error) {
      state = PostTeacherCreatePointFailState(
          error: teacherAddPointResponse.errorMessage ?? "Error");
    }
    return state;
  }
}
