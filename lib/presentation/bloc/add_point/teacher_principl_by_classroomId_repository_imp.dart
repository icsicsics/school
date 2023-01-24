import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/Get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/repository/teacher_principl_by_classroomId_repository.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';

class TeacherPrincipleByClassroomIdRepositoryImp
    extends BaseTeacherPrincipleByClassroomIdRepository {
  @override
  Future<AddPointState> getTeacherPrincipleByClassroomId(
      String token, String classroomId) async {
    AddPointState? state;
    GetTeacherPrinciplByClassroomIdResponse getTeacherPrinciplByClassroomIdResponse = GetTeacherPrinciplByClassroomIdResponse();
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
}
