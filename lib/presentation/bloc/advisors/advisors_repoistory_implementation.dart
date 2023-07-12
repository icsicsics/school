import 'dart:io';

import 'package:dio/dio.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/dio_helper.dart';
import 'package:schools/data/source/remote/model/advisors/request/create_meeting_request.dart';
import 'package:schools/data/source/remote/model/advisors/response/create_meeting_response.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide_model.dart';
import 'package:schools/data/source/remote/model/student_houses/get_student_houses_response.dart';
import 'package:schools/data/source/remote/repository/advisors_repository.dart';
import 'package:schools/presentation/bloc/advisors/advisors_bloc.dart';

class AdvisorsRepositoryImplementation extends AdvisorsRepository {
  @override
  Future<AdvisorsState> createMeeting(CreateMeetingRequest request) async {
    String token = await SharedPreferencesManager.getTokenDio() ?? "";
    try {
      Response response = await DioHelper.createGuideMeeting(
        token,
        request,
      );
      CreateMeetingResponse createMeetingResponse = CreateMeetingResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return CreateMeetingSuccessState(message : createMeetingResponse.data ?? "");
      } else {
        return CreateMeetingErrorState(errorMessage: createMeetingResponse.errorMessage ?? "");
      }
    } catch(e) {
      return CreateMeetingErrorState(errorMessage: "Something went wrong");
    }

  }

  @override
  Future<AdvisorsState> getGuides(String branchId, bool language) async {
    String token = await SharedPreferencesManager.getTokenDio() ?? "";
    Response response = await DioHelper.getGuides(
      branchId,
      token,
    );
    GuideModel guideModel = GuideModel.fromJson(response.data);
    if (response.statusCode == 200) {
      return GetGuidesSuccessState(guides: guideModel.guides!);
    } else {
      return GetGuidesErrorState(errorMessage: guideModel.errorMessage!);
    }
  }

  @override
  Future<AdvisorsState> getAdvisors(String classRoomToSectionId, bool language) async {
    String token = await SharedPreferencesManager.getTokenDio() ?? "";
    Response response = await DioHelper.getStudentHouses(
      token,
      classRoomToSectionId,
    );
    GetStudentHousesResponse getStudentHousesResponse = GetStudentHousesResponse.fromJson(response.data);
    if (response.statusCode == 200) {
      return GetAdvisorsSuccessState(advisors: getStudentHousesResponse.data?.advisors ?? []);
    } else {
      return GetAdvisorsErrorState(errorMessage: getStudentHousesResponse.errorMessage ?? "");
    }
  }
}
