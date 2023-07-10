import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/advisor.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/advisors/advisors_bloc.dart';
import 'package:schools/presentation/screens/advisors/utils/open_request_meeting_bottom_sheet.dart';
import 'package:schools/presentation/screens/advisors/widgets/advisor_widget.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/widgets/utils/open_notes_bottom_sheet.dart';

class AdvisorsScreen extends BaseStatefulWidget {
  final List<Advisor> advisors;
  final String studentId;
  final String studentName;
  final String studentImage;
  final String branchId;
  final String classroomToSectionId;
  final String teacherId;

  const AdvisorsScreen({
    Key? key,
    required this.advisors,
    required this.studentId,
    required this.studentName,
    required this.studentImage,
    required this.branchId,
    required this.classroomToSectionId,
    required this.teacherId,
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() {
    return _AdvisorsScreenState();
  }
}

class _AdvisorsScreenState extends BaseState<AdvisorsScreen> {
  AdvisorsBloc get _bloc => BlocProvider.of<AdvisorsBloc>(context);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<AdvisorsBloc, AdvisorsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetGuidesSuccessState) {
          openRequestMeetingBottomSheet(
            context: context,
            height: 350,
            guides: state.guides,
            studentId: widget.studentId,
            classroomToSectionId: widget.classroomToSectionId,
            teacherId: widget.teacherId,
          );
        } else if (state is GetGuidesErrorState) {
          showErrorDialogFunction(context: context, textMessage: state.errorMessage);
        } else if (state is OpenRequestMeetingBottomSheetState) {
        } else if (state is NavigateBackState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(),
          floatingActionButton: InkWell(
            onTap: () {
              _bloc.add(GetGuidesEvent(branchId: widget.branchId));
              // openNotesBottomSheet(
              //   context: context,
              //   height: 350,
              // );
            },
            child: Container(
                height: 40,
                width: 145,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(59, 187, 172, 1),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Color.fromRGBO(59, 187, 172, 0.5),
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImagesPath.calendar,
                      width: 20,
                      height: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      S.of(context).requestMeeting,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        letterSpacing: -0.1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
          ),
          body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return AdvisorWidget(
                studentName: widget.studentName,
                studentImage: widget.studentImage,
                advisors: widget.advisors,
              );
            },
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Advisor Record',
        style: TextStyle(
          color: Color.fromRGBO(23, 23, 23, 1),
        ),
      ),
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          ImagesPath.arrowBackIcon,
          fit: BoxFit.scaleDown,
          width: 20,
          height: 20,
          matchTextDirection: true,
          color: Colors.black,
        ),
      ),
      foregroundColor: Colors.white,
    );
  }
}
