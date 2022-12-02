import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/verify_content_widget.dart';

class VerifyScreen extends BaseStatefulWidget{
  const VerifyScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState()=>_VerifyScreenState();
}
class _VerifyScreenState extends BaseState<VerifyScreen> {
  @override
  Widget baseBuild(BuildContext context) {
   return const Scaffold(
     body: VerifyContentWidget(),
   );
  }

}