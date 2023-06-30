import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/about/about_bloc.dart';
import 'package:schools/presentation/screens/terms/widget/terms_and_conditions_content_widget.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/screens/about/widget/about_content_widget.dart';

class TermsAndConditions extends BaseStatefulWidget {
  const TermsAndConditions({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _TermsAndConditionsStatus();
}

class _TermsAndConditionsStatus extends BaseState<TermsAndConditions> {
  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<AboutBloc, AboutState>(
        listener: (context, state) {},
        builder: (context, state) {
          return const TermsAndConditionsContentWidget();
        },
      ),
    );
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
            onPressed: () {},
            icon: const Icon(Icons.mail,
                color: ColorsManager.secondaryColor, size: 30),
          ),
        ],
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: S.of(context).termsAndConditions),
      );
}
