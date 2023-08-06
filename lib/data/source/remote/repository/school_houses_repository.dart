import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';

abstract class BaseSchoolHousesRepository {
  Future<SchoolHousesState> getClassHouses(String token,String classRoomId,bool isComingFromHome,int search);
  Future<SchoolHousesState> getStudentHouses(String token,String classroomToSectionId);
  Future<SchoolHousesState> getSearchValues(String token);
  Future<SchoolHousesState> getGuides(String branchId,bool language);


}