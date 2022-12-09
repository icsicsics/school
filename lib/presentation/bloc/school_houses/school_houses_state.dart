part of 'school_houses_bloc.dart';

@immutable
abstract class SchoolHousesState {}

class SchoolHousesInitialState extends SchoolHousesState {}

class GetSchoolHousesLoadingState extends SchoolHousesState {}

class GetSchoolHousesSuccessState extends SchoolHousesState {}

class GetSchoolHousesFillState extends SchoolHousesState {}

class GetSchoolHousesErrorState extends SchoolHousesState {}
