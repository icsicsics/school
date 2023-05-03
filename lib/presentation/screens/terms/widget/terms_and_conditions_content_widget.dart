import 'package:flutter/material.dart';
import 'package:schools/presentation/screens/about/widget/about_header_widget.dart';
import 'package:schools/presentation/screens/terms/terms_and_conditions_screen.dart';
import 'package:schools/presentation/screens/terms/terms_and_conditions_screen.dart';
import 'package:schools/presentation/screens/terms/terms_and_conditions_screen.dart';
import 'package:schools/presentation/screens/terms/terms_and_conditions_screen.dart';
import 'package:schools/presentation/screens/terms/terms_and_conditions_screen.dart';
import 'package:schools/presentation/screens/terms/terms_and_conditions_screen.dart';
import 'package:schools/presentation/screens/terms/widget/terms_and_conditions_header_widget.dart';

class TermsAndConditionsContentWidget extends StatefulWidget {
  const TermsAndConditionsContentWidget({Key? key}) : super(key: key);

  @override
  State<TermsAndConditionsContentWidget> createState() => _TermsAndConditionsContentWidgetState();
}

class _TermsAndConditionsContentWidgetState extends State<TermsAndConditionsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [TermsAndConditionsHeaderWidget()],
    );
  }
}
