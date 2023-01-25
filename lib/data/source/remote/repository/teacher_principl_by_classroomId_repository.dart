import 'package:schools/data/source/remote/model/teacher_point/request/teacher_add_point_request.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';

abstract class BaseTeacherPrincipleByClassroomIdRepository {
  Future<AddPointState> getTeacherPrincipleByClassroomId(String token, String classroomId);
  Future<AddPointState> postTeacherAddPoint(String token, TeacherAddPointRequest request);
}
