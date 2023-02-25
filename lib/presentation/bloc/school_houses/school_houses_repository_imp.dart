import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/data/source/remote/model/student_houses/get_search_values_response.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/repository/school_houses_repository.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';

class SchoolHousesRepositoryImp extends BaseSchoolHousesRepository {
  @override
  Future<SchoolHousesState> getClassHouses(
      String token, String classRoomId, bool isComingFromHome) async {
    SchoolHousesState? state;
    GetClassHousesResponse getClassHousesResponse = GetClassHousesResponse();
    try {
      Response response =
          await DioHelper.getClassHouses(token, classRoomId, isComingFromHome);
      getClassHousesResponse = GetClassHousesResponse.fromJson(response.data);
      if (getClassHousesResponse.data != null) {
        return GetSchoolHousesSuccessState(response: getClassHousesResponse);
      }
    } catch (error) {
      state = GetSchoolHousesFillState(
          error: getClassHousesResponse.errorMessage ?? "Error");
    }
    return state!;
  }

  @override
  Future<SchoolHousesState> getStudentHouses(
      String token, String classroomToSectionId) async {
    SchoolHousesState? state;
    GetStudentHousesResponse getStudentHousesResponse =
        GetStudentHousesResponse();
    try {
      Response response =
          await DioHelper.getStudentHouses(token, classroomToSectionId);
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

  @override
  Future<SchoolHousesState> getSearchValues(String token) async {
    SchoolHousesState? state;
    GetSearchValuesResponse getSearchValuesResponse =
    GetSearchValuesResponse();
    try {
      Response response =
          await DioHelper.getSearchValues(token);
      getSearchValuesResponse =
          GetSearchValuesResponse.fromJson(response.data);
      if (getSearchValuesResponse.data != null) {
        return GetSearchValuesSuccessState(values: getSearchValuesResponse.data?? []);
      }
    } catch (error) {
      print("${error.toString()}");
      state = GetSearchValuesFailState(
          error: getSearchValuesResponse.errorMessage ?? "Error");
    }
    return state!;
  }
}
