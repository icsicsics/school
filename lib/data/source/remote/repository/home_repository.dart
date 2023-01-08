import 'package:schools/presentation/bloc/home/home_bloc.dart';

abstract class BaseHomeRepository {
  Future<HomeState> getTeacherHome(String token);
}