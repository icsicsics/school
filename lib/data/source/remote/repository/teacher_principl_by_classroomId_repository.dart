import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';

abstract class BaseTeacherPrincipleByClassroomIdRepository {
  Future<AddPointState> getTeacherPrincipleByClassroomId(String token, String classroomId);
}
