import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/verify_content_widget.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';

class VerifyScreen extends BaseStatefulWidget {
  final String phoneNumber;

  const VerifyScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _VerifyScreenState();
}

class _VerifyScreenState extends BaseState<VerifyScreen> {
  VerifyBloc get _bloc => BlocProvider.of<VerifyBloc>(context);
  String _language = '';

  @override
  void initState() {
    _bloc.add(GetLanguageEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: ColorsManager.whiteColor,
      body: BlocConsumer<VerifyBloc, VerifyState>(
        listener: (context, state) {
          if (state is GetLanguageSuccessState) {
            _language = state.language;
          } else if (state is VerifyCodeSuccessState) {
            BlocProvider.of<VerifyBloc>(context).add(UpdateDeviceTokenEvent());
          } else if (state is VerifyCodeErrorState) {
          } else if (state is UpdateDeviceTokenSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          } else if (state is UpdateDeviceTokenFailState) {
            showErrorDialogFunction(
                context: context, textMessage: state.errorMessage);
          }
        },
        builder: (context, state) {
          return VerifyContentWidget(
            language: _language,
            phoneNumber: widget.phoneNumber,
          );
        },
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: BoldTextWidget(
        text: S.of(context).verificationCode,
        fontSize: 27,
        color: ColorsManager.blackColor,
      ),
      centerTitle: true,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border:
                    Border.all(width: 1, color: ColorsManager.backgroundColor)),
            child: const Center(
                child: Icon(
              Icons.arrow_back,
              color: ColorsManager.blackColor,
            )),
          ),
        ),
      ),
    );
  }
}
