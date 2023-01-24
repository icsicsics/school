import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';

abstract class BaseMyChildrenRepository {
  Future<MyChildrenState> getTeacherStudentProfileInSchoolHouse(
      String token, String studentId);
}
