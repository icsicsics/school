import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/login/login_bloc.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/authentication/login/widgets/login_content_widget.dart';
import 'package:schools/presentation/ui/authentication/verify/verify_screen.dart';

class LoginScreen extends BaseStatefulWidget {
  final bool isFather;

  const LoginScreen({super.key, required this.isFather});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> {
  LoginBloc get _loginBloc => BlocProvider.of<LoginBloc>(context);
  TextEditingController countryController = TextEditingController();
  bool _isFather = false;
  String _countryCode= "";
  @override
  void initState() {
    _isFather = widget.isFather;
    _loginBloc.add(LoginIsFatherEvent(isFather: widget.isFather));
    _loginBloc.add(GetLanguageEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    String _language = '';
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => VerifyScreen(
                          phoneNumber: state.phoneNumber,
                        )));
          } else if (state is VerifyPhoneNumberErrorState) {
            showErrorDialogFunction(
                context: context,
                textMessage: S.of(context).thePhoneNumberIsWrong);
          } else if(state is SelectCountryCodeState){
            _countryCode = state.phoneNumber.dialCode ?? "";
          }
        },
        builder: (context, state) {
          return LoginContentWidget(
              countryController: countryController,
              loginBloc: _loginBloc,
              isFather: _isFather,
              language: _language);
        },
      ),
    );
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
    _isFather = state.isFather;
    await SharedPreferencesManager.setIsFather(state.isFather);
  }
}
