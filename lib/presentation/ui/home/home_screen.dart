import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/data/source/remote/model/weather/weather_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/shere_widgets/restart_widget.dart';
import 'package:schools/presentation/ui/authentication/login/login_screen.dart';
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
  GetChildrenByParentResponse _parentHomeResponse = GetChildrenByParentResponse();
  TeacherStudentProfileInSchoolHouseResponse _teacherStudentProfileInSchoolHouseResponse = TeacherStudentProfileInSchoolHouseResponse();
  WeatherResponse _weatherResponse = WeatherResponse();
  String _language = '';
  String _token = '';

  @override
  void initState() {
    _homeBloc.add(GetIsFatherEvent());
    _homeBloc.add(GetLanguageEvent());
    _homeBloc.add(GetTokenEvent());
    _homeBloc.add(GetWeatherEvent());

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
          _token = state.token;
          if (_isFather) {
            _homeBloc.add(GetFatherHomeEvent(token: state.token));
          } else {
            _homeBloc.add(GetTeacherHomeEvent(token: state.token));
          }
        } else if (state is GetTeacherHomeSuccessState) {
          _teacherHomeResponse = state.response;
          _homeBloc.add(GetTeacherInfoEvent(token: _token));
        } else if (state is GetTeacherHomeFillState) {
          _onFillState(state.error);
          hideLoading();
        } else if (state is GetParentHomeSuccessState) {
          _parentHomeResponse = state.response;
          _homeBloc.add(GetFatherInfoEvent(token: _token));
        } else if (state is GetParentHomeFillState) {
          _onFillState(state.error);
          hideLoading();
        }else if (state is GetTeacherInfoSuccessState){
          _homeBloc.teacherInfoResponse=state.response;
          hideLoading();
        }else if (state is GetFatherInfoSuccessState){
          _homeBloc.fatherInfoResponse=state.response;
          hideLoading();
        }else if (state is GetFatherInfoFillState){
          hideLoading();
          _onGetFatherInfoFillState(state.error);
        }else if(state is GetTeacherInfoFillState){
          hideLoading();
          _onGetTeacherInfoFillState(state.error);
        }else if (state is GetWeatherSuccessState){
          _weatherResponse=state.weather;
        }else if (state is GetWeatherFillState){
          _onGetWeatherFillState(state.error);
        } else if (state is SwitchAccountState){
          _switchAccount(context);
        } else if(state is GetTeacherStudentProfileInSchoolHouseSuccessState){
          hideLoading();
          _teacherStudentProfileInSchoolHouseResponse = state.response;
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.whiteColor,
            key: _key,
            drawer: SideMenuScreen(
              isComFromHome: true,
              language: _language,
              token: _token,
            ),
            body: HomeContentWidget(
              weatherResponse: _weatherResponse,
                globalKey: _key,
                isFather: _isFather,
                bloc: _homeBloc,
                language: _language,
                parentHomeResponse: _parentHomeResponse,
                teacherHomeResponse: _teacherHomeResponse,
                teacherStudentProfileInSchoolHouseResponse:_teacherStudentProfileInSchoolHouseResponse,
                token: _token));
      },
    );
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }

  void _onFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetTeacherInfoFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetFatherInfoFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetWeatherFillState(String error)=>showErrorDialogFunction(context: context, textMessage: error);

  void _switchAccount(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) =>
                LoginScreen(isFather: _isFather == true ? false : true)),
            (route) => false);
  }
}
