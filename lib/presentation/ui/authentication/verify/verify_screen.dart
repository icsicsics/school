import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
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
      appBar: _appBar(),
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

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const BoldTextWidget(
        text: 'Verification Code',
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
