import 'package:schools/data/source/remote/model/advisors/request/create_meeting_request.dart';
import 'package:schools/presentation/bloc/advisors/advisors_bloc.dart';

abstract class AdvisorsRepository {

  Future<AdvisorsState> getGuides(String branchId,bool language);

  Future<AdvisorsState> createMeeting(CreateMeetingRequest request);
}