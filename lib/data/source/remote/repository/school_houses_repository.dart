import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';

abstract class BaseSchoolHousesRepository {
  Future<SchoolHousesState> getClassHouses(String token,String classRoomId,bool isComingFromHome);
}