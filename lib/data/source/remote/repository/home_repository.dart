import 'package:schools/presentation/bloc/home/home_bloc.dart';

abstract class BaseHomeRepository {
  Future<HomeState> getTeacherHome(String token);
  Future<HomeState> getParentHome(String token);
  Future<HomeState> getFatherInfo(String token);
  Future<HomeState> getTeacherInfo(String token);
  Future<HomeState> getWeather(late,long);
}