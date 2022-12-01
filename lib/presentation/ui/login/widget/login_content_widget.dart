import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/select_country_text_field_widget.dart';

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget({Key? key}) : super(key: key);

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const  [
        Padding(
          padding: EdgeInsets.all(10),
          child: SelectCountryTextFieldWidget(),
        )
      ],
    );
  }
}
