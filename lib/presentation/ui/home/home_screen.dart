import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/restart_widget.dart';
import 'package:schools/presentation/ui/home/widgets/home_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/side_menu_screen.dart';

class HomeScreen extends BaseStatefulWidget {
  const HomeScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> {
  HomeBloc get _homeBloc => BlocProvider.of<HomeBloc>(context);
  bool _isFather = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  GetTeacherHomeResponse _teacherHomeResponse = GetTeacherHomeResponse();
  GetChildrenByParentResponse _parentHomeResponse =
      GetChildrenByParentResponse();
  String _language = '';

  @override
  void initState() {
    _homeBloc.add(GetIsFatherEvent());
    _homeBloc.add(GetLanguageEvent());
    _homeBloc.add(GetTokenEvent());

    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GetHomeLoadingState) {
          showLoading();
        } else if (state is GetIsFatherState) {
          _isFather = state.isFather;
        } else if (state is ChangeLanguageSuccessState) {
          _restartApp();
        } else if (state is GetLanguageSuccessState) {
          _language = state.language;
        } else if (state is GetTokenSuccessState) {
          if (_isFather) {
            _homeBloc.add(GetFatherHomeEvent(token: state.token));
          } else {
            _homeBloc.add(GetTeacherHomeEvent(token: state.token));
          }
        } else if (state is GetTeacherHomeSuccessState) {
          _teacherHomeResponse = state.response;
          hideLoading();
        } else if (state is GetTeacherHomeFillState) {
          _onFillState(state.error);
        } else if (state is GetParentHomeSuccessState) {
          _parentHomeResponse = state.response;
          hideLoading();
        } else if (state is GetParentHomeFillState) {
          _onFillState(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.whiteColor,
            key: _key,
            drawer: SideMenuScreen(
              isComFromHome: true,
              language: _language,
            ),
            body: HomeContentWidget(
                globalKey: _key,
                isFather: _isFather,
                bloc: _homeBloc,
                language: _language,
                parentHomeResponse: _parentHomeResponse,
                teacherHomeResponse: _teacherHomeResponse));
      },
    );
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }

  void _onFillState(String error) {}
}
