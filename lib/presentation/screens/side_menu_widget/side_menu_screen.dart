import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/screens/about/about_screen.dart';
import 'package:schools/presentation/screens/channels/channels_screen.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/widgets/dialogs/show_logout_function.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';
import 'package:schools/presentation/screens/profile/profile_screen.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/side_menu_content_widget.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/curve.dart';
import 'package:schools/presentation/screens/web_view/web_view_screen.dart';

class SideMenuScreen extends StatefulWidget {
  final bool isComFromHome;
  final String language;
  final String token;

  const SideMenuScreen(
      {Key? key,
      required this.isComFromHome,
      required this.language,
      required this.token})
      : super(key: key);

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  SideMenuBloc get _bloc => BlocProvider.of<SideMenuBloc>(context);
  bool _isFather = false;
  String userName = '';

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    if (_bloc.teacherInfoResponse.data != null ||
        _bloc.fatherInfoResponse.data != null) {
      _bloc.add(GetProfileImageFromShearedPrefranceEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: widget.language == "en"
            ? RPSCustomPainterLeft1()
            : RPSCustomPainterRight1(),
        child: Container(
            color: ColorsManager.yellow,
            child: ClipPath(
                clipper: widget.language == "en"
                    ? RPSCustomPainterLeft2()
                    : RPSCustomPainterRight2(),
                child: Container(
                    color: Colors.white,
                    child: BlocConsumer<SideMenuBloc, SideMenuState>(
                      listener: (context, state) {
                        if (state is SideMenuHomeState) {
                          _onSideMenuHomeState(context);
                        } else if (state is SideMenuUserProfileState) {
                          _onSideMenuProfileState(context);
                        } else if (state is SideMenuContactUsState) {
                          _onSideMenuContactUsState(context);
                        } else if (state is SideMenuAboutAppState) {
                          _onSideMenuAboutAppState(context);
                        } else if (state is GetIsFatherState) {
                          _isFather = state.isFather;
                          if (_isFather) {
                            _bloc.add(GetFatherInfoEvent(token: widget.token));
                          } else {
                            _bloc.add(GetTeacherInfoEvent(token: widget.token));
                          }
                        } else if (state is SwitchAccountState) {
                          _switchAccount(context);
                        } else if (state is LogoutState) {
                          showLogoutFunction(
                              context: context, yesAction: () => _logout());
                        } else if (state is GetTeacherInfoSuccessState) {
                          _bloc.add(SetProfileImageInShearedPrefranceEvent(
                              image: state.response.data!.getImage!.mediaUrl
                                  .toString()));
                        } else if (state is GetTeacherInfoFillState) {
                          _onGetTeacherInfoFillState(state.error);
                          Navigator.pop(context);
                        } else if (state is GetFatherInfoSuccessState) {
                          Navigator.pop(context);
                          //todo add father image;
                          // _bloc.add(SetProfileImageInShearedPrefranceEvent(
                          //     image:
                          //         state.response.data!.phoneNumber.toString()));
                        } else if (state is GetFatherInfoFillState) {
                          _onGetFatherInfoFillState(state.error);
                          Navigator.pop(context);
                        } else if (state is GetSideMenuLoadingState) {
                          showDialog(
                              context: context,
                              builder: (_) => const Center(
                                    child: CircularProgressIndicator(),
                                  ));
                        } else if (state
                            is GetProfileImageFromShearedPrefranceSuccessState) {
                          Navigator.pop(context);
                        } else if (state
                            is SetProfileImageInShearedPrefranceSuccessState) {
                          Navigator.pop(context);
                          _bloc.add(GetProfileImageFromShearedPrefranceEvent());
                        } else if (state is OpenWebViewState) {
                          _navigateToWebView(
                              screenTitle: state.screenTitle,
                              isUrlContent: state.isUrlContent,
                              content: state.webViewContent);
                        }
                        else if (state is NavigateToAboutScreenState) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AboutScreen()));
                        } else if(state is NavigateToChannelsScreenState){
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return const ChannelsScreen();
                          }));
                        }
                      },
                      builder: (context, state) {
                        return SideMenuContentWidget(
                          language: widget.language,
                          bloc: _bloc,
                          isFather: _isFather,
                        );
                      },
                    )))));
  }

  void _onSideMenuHomeState(context) {
    if (widget.isComFromHome == true) {
      Navigator.pop(context);
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
          (route) => false);
    }
  }

  void _onSideMenuProfileState(context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
  }

  void _onSideMenuContactUsState(context) {}

  void _onSideMenuAboutAppState(context) {}

  void _switchAccount(context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) =>
                LoginScreen()),
        (route) => false).then((value) {
      if (_isFather) {
        _bloc.add(GetFatherInfoEvent(token: widget.token));
      } else {
        _bloc.add(GetTeacherInfoEvent(token: widget.token));
      }
    });
  }

  void _logout() {
    _bloc.fatherInfoResponse = FatherInfoResponse();
    _bloc.teacherInfoResponse = TeacherInfoResponse();
    _bloc.add(ClearTokenEvent());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (_) =>
                ChannelsScreen()),
        (route) => false);
  }

  void _onGetTeacherInfoFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetFatherInfoFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  Future _navigateToWebView({
    required String screenTitle,
    required bool isUrlContent,
    required String content,
  }) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => WebViewScreen(
                isUrlContent: isUrlContent,
                content: content,
                screenTitle: screenTitle)));
  }
}
