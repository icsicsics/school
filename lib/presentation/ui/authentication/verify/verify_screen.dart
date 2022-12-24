import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/verify_content_widget.dart';

class VerifyScreen extends BaseStatefulWidget {
  const VerifyScreen({super.key});

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
      backgroundColor: ColorsManager.whiteColor,
      body: BlocConsumer<VerifyBloc, VerifyState>(
        listener: (context, state) {
          if (state is GetLanguageSuccessState) {
            _language = state.language;
          }
        },
        builder: (context, state) {
          return VerifyContentWidget(language: _language);
        },
      ),
    );
  }
}
