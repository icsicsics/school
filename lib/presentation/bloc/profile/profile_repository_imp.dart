import 'package:dio/dio.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/repository/profile_repository.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';

class ProfileRepositoryImp extends BaseProfileRepository {
  @override
  Future<ProfileState> getTeacherInfo(String token) async{
    ProfileState? state;
    TeacherInfoResponse teacherInfoResponse = TeacherInfoResponse();
    try {
      Response response = await DioHelper.getTeacherInfo(token);
      teacherInfoResponse = TeacherInfoResponse.fromJson(response.data);
      if (teacherInfoResponse.data!=null) {
        return GetTeacherInfoSuccessState(response: teacherInfoResponse);
      }
    } catch (error) {
      state = GetTeacherInfoFillState(error: teacherInfoResponse.errorMessage!);
    }
    return state!;
  }

}
