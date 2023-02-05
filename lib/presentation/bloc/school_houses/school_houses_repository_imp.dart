import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/data/source/remote/repository/school_houses_repository.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';

class SchoolHousesRepositoryImp extends BaseSchoolHousesRepository {
  @override
  Future<SchoolHousesState> getClassHouses(
      String token, String classRoomId,bool isComingFromHome) async {
    SchoolHousesState? state;
    GetClassHousesResponse getClassHousesResponse = GetClassHousesResponse();
    try {
      Response response = await DioHelper.getClassHouses(token, classRoomId,isComingFromHome);
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
}
