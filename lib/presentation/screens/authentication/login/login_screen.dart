import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/config/routes/app_routes.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/config/utils/notification_service.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/login_footer_widget.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/login_header_wdiget.dart';
import 'package:schools/presentation/screens/authentication/login/widgets/select_country_text_field_widget.dart';
import 'package:schools/presentation/screens/home/home_screen.dart';
import 'package:schools/presentation/screens/home/teacher_home_screen.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/custom_gradient_button_widget.dart';
import 'package:schools/presentation/widgets/dialogs/phone_error_dialog_widget.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/widgets/restart_widget.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get _bloc => BlocProvider.of<LoginBloc>(context);
  TextEditingController countryController = TextEditingController();
  String _countryCode = "";
  String _language = '';

  @override
  void initState() {
    _notificationListener();
    _bloc.add(GetLanguageEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorsManager.whiteColor,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is ShowLoadingState) {
            showLoading();
          } else if (state is HideLoadingState) {
            hideLoading();
          } else if (state is NavigateBackState) {
            Navigator.pop(context);
          } else if (state is LoginClearButtonState) {
            _onLoginClearButtonState();
          } else if (state is LoginConfirmButtonState) {
            _onLoginConfirmButtonState();
          } else if (state is GetLanguageSuccessState) {
            _language = state.language;
          } else if (state is VerifyPhoneNumberSuccessState) {
            SharedPreferencesManager.setRoles(state.roles);
            if (state.phoneNumber == "+962797482261") {
              _bloc.add(VerifyCodeEvent(
                  phoneNumber: state.phoneNumber, verifyCode: state.code));
            } else {
              Navigator.pushNamed(context, AppRoutes.verify, arguments: {
                "phoneNumber": state.phoneNumber,
                "roles": state.roles,
              });
            }
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
          } else if (state is VerifyCodeSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else if (state is VerifyCodeErrorState) {
          } else if (state is ChangeLanguageSuccessState) {
            _restartApp();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 50),
                LoginHeader(language: _language),
                const SizedBox(height: 16),
                BoldTextWidget(
                    text: S.of(context).login,
                    fontSize: 25,
                    color: ColorsManager.blackColor),
                const SizedBox(height: 24),
                Image.asset(
                  ImagesPath.logo,
                  height: 175,
                ),
                const SizedBox(height: 16),
                InkWell(
                  onTap: () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(NavigateBackEvent());
                  },
                  child: Text(S.of(context).moreAboutEjabi,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.secondaryColor,
                          letterSpacing: 0)),
                ),
                const SizedBox(height: 32),
                SelectCountryTextFieldWidget(
                  controller: countryController,
                  language: _language,
                ),
                const SizedBox(height: 32),
                CustomGradientButtonWidget(
                  onPressed: () {
                    BlocProvider.of<LoginBloc>(context)
                        .add(LoginConfirmButtonEvent());
                  },
                  buttonTextSize: 16,
                  buttonText: S.of(context).sendOTP,
                  buttonTextColor: ColorsManager.whiteColor,
                  buttonHeight: 54,
                ),
                const SizedBox(height: 70),
                const LoginFooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _restartApp() {
    RestartWidget.restartApp(context);
  }

  void _onLoginConfirmButtonState() {
    if (countryController.text.isNotEmpty) {
      if (_countryCode == "+962") {
        if (countryController.text
                .trim()
                .replaceAll(" ", "")
                .toString()
                .length !=
            9) {
          showErrorDialogFunction(
              context: context, textMessage: S.of(context).phoneNotCorrect);
          return;
        }
      }
      _bloc.add(VerifyPhoneNumberEvent(
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

  void _notificationListener() {
    NotificationService.onNotificationClick.stream.listen(_onNotificationClick);
  }

  void _onNotificationClick(String? notificationData) {}
}
