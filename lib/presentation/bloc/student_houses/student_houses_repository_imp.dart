import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/repository/student_houses_repository.dart';
import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';

class StudentHousesRepositoryImp extends BaseStudentHousesRepository {
  @override
  Future<StudentHousesState> getStudentHouses(
      String token, String classroomToSectionId, String houseId) async {
    StudentHousesState? state;
    GetStudentHousesResponse getStudentHousesResponse =
        GetStudentHousesResponse();
    try {
      Response response = await DioHelper.getStudentHouses(
          token, classroomToSectionId, houseId);
      getStudentHousesResponse =
          GetStudentHousesResponse.fromJson(response.data);
      if (getStudentHousesResponse.data != null) {
        return GetStudentHousesSuccessState(response: getStudentHousesResponse);
      }
    } catch (error) {
      state = GetStudentHousesFillState(
          error: getStudentHousesResponse.errorMessage ?? "Error");
    }
    return state!;
  }
}
