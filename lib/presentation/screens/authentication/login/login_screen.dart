import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_stateful_widget.dart';
import 'package:schools/core/notification_serves.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';
import 'package:schools/presentation/widgets/dialogs/phone_error_dialog_widget.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/login_content_widget.dart';
import 'package:schools/presentation/screens/authentication/verify/verify_screen.dart';
import 'package:schools/presentation/widgets/restart_widget.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get _loginBloc => BlocProvider.of<LoginBloc>(context);
  TextEditingController countryController = TextEditingController();
  String _countryCode = "";
  String _language = '';

  @override
  void initState() {
    _notificationListener();
    _loginBloc.add(GetLanguageEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is LoginClearButtonState) {
            _onLoginClearButtonState();
          } else if (state is LoginConfirmButtonState) {
            _onLoginConfirmButtonState();
          } else if (state is LoginIsFatherState) {
            _setIsFather(state);
          } else if (state is GetLanguageSuccessState) {
            _language = state.language;
          } else if (state is VerifyPhoneNumberSuccessState) {
            // _loginBloc.add(VerifyCodeEvent(
            //     phoneNumber: state.phoneNumber,
            //     verifyCode: state.code));
            //
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => VerifyScreen(
                          phoneNumber: state.phoneNumber,
                          roles: state.roles,
                        )));
          } else if (state is VerifyPhoneNumberErrorState) {

            showDialog(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) => Dialog(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    child: PhoneErrorDialogWidget(
                      textMessage: S.of(context).phoneErrorMessage,
                      language: _language,
                    )));

          } else if (state is SelectCountryCodeState) {
            _countryCode = state.phoneNumber.dialCode ?? "";
          } else if(state is VerifyCodeSuccessState){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));

          } else if (state is VerifyCodeErrorState){
          } else if (state is ChangeLanguageSuccessState) {
            _restartApp();
          }
        },
        builder: (context, state) {
          return LoginContentWidget(
              countryController: countryController,
              loginBloc: _loginBloc,
              language: _language);
        },
      ),
    );
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }

  void _onLoginConfirmButtonState() {
    if (countryController.text.isNotEmpty) {
      _loginBloc.add(VerifyPhoneNumberEvent(
          phoneNumber:
              "$_countryCode${countryController.text.trim().replaceAll(" ", "").toString()}"));
    } else if (countryController.text == "") {
      showErrorDialogFunction(
          context: context,
          textMessage: S.of(context).pleaseEnterThePhoneNumber);
    }
  }

  void _onLoginClearButtonState() {
    countryController.clear();
  }

  void _setIsFather(LoginIsFatherState state) async {
    await SharedPreferencesManager.setIsFather(state.isFather);
  }

  void _notificationListener() {
    NotificationService.onNotificationClick.stream.listen(_onNotificationClick);
  }

  void _onNotificationClick(String? notificationData) {
    print("object");
  }
}
