import 'package:schools/presentation/bloc/student_houses/student_houses_bloc.dart';

abstract class BaseStudentHousesRepository {
  Future<StudentHousesState> getStudentHouses(String token,String classroomToSectionId,String houseId);

}