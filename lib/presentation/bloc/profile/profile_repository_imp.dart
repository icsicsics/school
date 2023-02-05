import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/change_photo/response/teacher_change_photo_response.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/data/source/remote/repository/profile_repository.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';

class ProfileRepositoryImp extends BaseProfileRepository {
  @override
  Future<ProfileState> getTeacherInfo(String token) async {
    ProfileState? state;
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
  Future<ProfileState> getFatherInfo(String token) async {
    ProfileState? state;
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

  @override
  Future<ProfileState> teacherChangePhoto(String token, XFile xFile) async {
    ProfileState? state;
    TeacherChangePhotoResponse teacherChangePhotoResponse =
        TeacherChangePhotoResponse();
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(xFile.path,
            filename: xFile.name),
      });
      Response response =
          await DioHelper.teacherChangePhoto(token, formData);
      teacherChangePhotoResponse =
          TeacherChangePhotoResponse.fromJson(response.data);
      if (teacherChangePhotoResponse.data != null) {
        return TeacherChangePhotoSuccessState(
            response: teacherChangePhotoResponse);
      }
    } catch (error) {
      state = TeacherChangePhotoFillState(
          error: teacherChangePhotoResponse.errorMessage ?? "Error");
    }
    return state!;
  }

}
