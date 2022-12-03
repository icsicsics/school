import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/bloc/verify/verify_bloc.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/verify_content_widget.dart';

class VerifyScreen extends BaseStatefulWidget {
  const VerifyScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _VerifyScreenState();
}

class _VerifyScreenState extends BaseState<VerifyScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<VerifyBloc, VerifyState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return const VerifyContentWidget();
        },
      ),
    );
  }
}
