import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/card_widget.dart';

class LoginContentWidget extends StatefulWidget {
  const LoginContentWidget({Key? key}) : super(key: key);

  @override
  State<LoginContentWidget> createState() => _LoginContentWidgetState();
}

class _LoginContentWidgetState extends State<LoginContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CardWidget(child: Text("Hello")),
        CardWidget(child: Text("Hello")),
        CardWidget(child: Text("Hello")),
        CardWidget(child: Text("Hello")),
      ],
    );
  }
}
