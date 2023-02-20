import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';

abstract class BaseSideMenuRepository {
  Future<SideMenuState> getTeacherInfo(String token);

  Future<SideMenuState> getFatherInfo(String token);
}