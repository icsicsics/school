import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:schools/data/source/local/database_helper.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide_model.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/data/source/remote/model/student_houses/get_search_values_response.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/repository/school_houses_repository.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';

class SchoolHousesRepositoryImp extends BaseSchoolHousesRepository {
  @override
  Future<SchoolHousesState> getClassHouses(
      String token, String classRoomId, bool isComingFromHome,int search) async {
    SchoolHousesState? state;
    GetClassHousesResponse getClassHousesResponse = GetClassHousesResponse();
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if(connectivityResult == ConnectivityResult.none){
      bool isFather = await SharedPreferencesManager.getIsFather()  ?? false;
      if(isFather){
        getClassHousesResponse.data = (await databaseHelper.getParentOfflineData()).parentOfflineData?.schoolHouses ?? [];
      } else {
        getClassHousesResponse.data = (await databaseHelper.getTeacherOfflineData()).teacherOfflineData?.schoolHouses ?? [];
      }
      getClassHousesResponse.errorCode = 200;
      getClassHousesResponse.errorMessage = "Success";
      state = GetSchoolHousesSuccessState(response: getClassHousesResponse);
    } else {
      try {
        Response response =
        await DioHelper.getClassHouses(token, classRoomId, isComingFromHome,search);
        getClassHousesResponse = GetClassHousesResponse.fromJson(response.data);
        if (getClassHousesResponse.data != null) {
          state =  GetSchoolHousesSuccessState(response: getClassHousesResponse);
        }
      } catch (error) {
        state = GetSchoolHousesFillState(
            error: getClassHousesResponse.errorMessage ?? "Error");
      }
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
    final connectivityResult = await (Connectivity().checkConnectivity());
    DatabaseHelper databaseHelper = DatabaseHelper.instance;
    if(connectivityResult == ConnectivityResult.none){
      bool isFather = await SharedPreferencesManager.getIsFather()  ?? false;
      if(isFather){
        getSearchValuesResponse.data = (await databaseHelper.getParentOfflineData()).parentOfflineData?.searchByDateEnum ?? [];
      } else {
        getSearchValuesResponse.data = (await databaseHelper.getTeacherOfflineData()).teacherOfflineData?.searchByDateEnum ?? [];
      }
      getSearchValuesResponse.errorCode = 200;
      getSearchValuesResponse.errorMessage = "Success";
      state = GetSearchValuesSuccessState(values: getSearchValuesResponse.data?? []);
    } else {
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
    }

    return state!;
  }

  @override
  Future<SchoolHousesState> getGuides(String branchId, bool language) async {
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
