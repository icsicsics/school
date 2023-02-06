import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/class_houses/get_class_houses_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_chart_widget.dart';
import 'package:schools/presentation/ui/school_houses/widgets/school_houses_content_widget.dart';
import 'package:schools/presentation/ui/student_houses/student_houses_screen.dart';

class SchoolHousesScreen extends BaseStatefulWidget {
  final String token;
  final String classRoomId;
  final String language;
  final bool isComingFromHome;

  const SchoolHousesScreen(
      {super.key,
      required this.token,
      required this.classRoomId,
      required this.language,
      required this.isComingFromHome});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SchoolHousesScreenState();
}

class _SchoolHousesScreenState extends BaseState<SchoolHousesScreen> {
  SchoolHousesBloc get _schoolHousesBloc =>
      BlocProvider.of<SchoolHousesBloc>(context);
  GetClassHousesResponse getClassHousesResponse = GetClassHousesResponse();

  @override
  void initState() {
    _schoolHousesBloc.add(GetSchoolHousesEvent(
        token: widget.token,
        classRoomId: widget.classRoomId,
        isComingFromHome: widget.isComingFromHome));
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  ColorsManager.primaryColor,
                  ColorsManager.secondaryColor,
                ],
                stops: [0.5, 0.8],
              )),
              height: 500,
              child: getClassHousesResponse.data != null
                  ? SchoolHousesChartWidget(schoolHousesBloc: _schoolHousesBloc)
                  : Container(),
            ),
            BlocConsumer<SchoolHousesBloc, SchoolHousesState>(
              listener: (context, state) {
                if (state is GetSchoolHousesLoadingState) {
                  showLoading();
                } else if (state is GetSchoolHousesSuccessState) {
                  getClassHousesResponse = state.response;
                  hideLoading();
                } else if (state is GetSchoolHousesFillState) {
                  _onGetSchoolHousesFillState(state.error);
                } else if (state is NavigateToNotificationScreenState) {
                  _navigateToNotificationScreen();
                } else if (state is NavigateToStudentHousesScreenState) {
                  _navigateToStudentHousesScreen(
                      state.data.classroomToSectionId!);
                }
              },
              builder: (context, state) {
                return SchoolHousesContentWidget(
                  isComingFromHome: widget.isComingFromHome,
                  schoolHousesBloc: _schoolHousesBloc,
                  getClassHousesResponse: getClassHousesResponse,
                  language: widget.language,
                  token: widget.token,
                );
              },
            ),
          ],
        )));
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: ColorsManager.secondaryColor, size: 25),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => BlocProvider.of<SchoolHousesBloc>(context)
                .add(NavigateToNotificationScreenEvent()),
            icon: const Icon(Icons.mail,
                color: ColorsManager.secondaryColor, size: 25),
          ),
        ],
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: S.of(context).classHouses),
      );

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);

  void _onGetSchoolHousesFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _navigateToStudentHousesScreen(String s) => Navigator.push(
      context,
      MaterialPageRoute(
          builder: (_) => StudentHousesScreen(
              token: widget.token,
              classroomToSectionId: s,
              language: widget.language)));
}
