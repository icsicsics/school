import 'package:schools/presentation/bloc/home/home_bloc.dart';

abstract class BaseHomeRepository {
  Future<HomeState> getTeacherHome(String token);
  Future<HomeState> getParentHome(String token);
  Future<HomeState> getFatherInfo(String token);
  Future<HomeState> getTeacherInfo(String token);
  Future<HomeState> getWeather(late,long,lan);
  Future<HomeState> getTeacherOffline(String token,bool language,int search);
  Future<HomeState> getParentOffline(String token,bool language,int search);
}