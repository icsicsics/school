import 'package:schools/presentation/bloc/profile/profile_bloc.dart';

abstract class BaseProfileRepository {
  Future<ProfileState> getTeacherInfo(String token);

  Future<ProfileState> getFatherInfo(String token);
}
