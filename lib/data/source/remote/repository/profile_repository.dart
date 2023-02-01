import 'package:dio/dio.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';

abstract class BaseProfileRepository {
  Future<ProfileState> getTeacherInfo(String token);

  Future<ProfileState> getFatherInfo(String token);

  Future<ProfileState> teacherChangePhoto(String token, FormData formData);
}
