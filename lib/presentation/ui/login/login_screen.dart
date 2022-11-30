import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class LoginScreen extends BaseStatefulWidget {
  const LoginScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState()=>_LoginScreenState();

}
class _LoginScreenState extends BaseState<LoginScreen> {

  @override
  Widget baseBuild(BuildContext context) {
   return Scaffold(

     appBar: AppBar(
       backgroundColor: ColorsManager.primaryColor,
       title: const MediumTextWidget(text:"Interactive School Counselling",fontSize:20,color: ColorsManager.whiteColor),
     ),
   );
  }

}