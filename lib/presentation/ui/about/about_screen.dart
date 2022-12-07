import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/about/about_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/about/widget/about_content_widget.dart';

class AboutScreen extends BaseStatefulWidget {
  const AboutScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _AboutScreenStatus();

}

class _AboutScreenStatus extends BaseState<AboutScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocConsumer<AboutBloc, AboutState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return AboutContentWidget();
        },
      ),

    );
  }

  PreferredSizeWidget _appBar() =>
      AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: ColorsManager.secondaryColor, size: 25),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active,
                color: ColorsManager.secondaryColor, size: 25),
          ),
        ],
        title: const BoldTextWidget(
            color: ColorsManager.secondaryColor, fontSize: 20, text: "About"),
      );
}