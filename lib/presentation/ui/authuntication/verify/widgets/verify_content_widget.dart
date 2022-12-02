import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/authuntication/verify/widgets/verify_header_widget.dart';

class VerifyContentWidget extends StatefulWidget {
  const VerifyContentWidget({Key? key}) : super(key: key);

  @override
  State<VerifyContentWidget> createState() => _VerifyContentWidgetState();
}

class _VerifyContentWidgetState extends State<VerifyContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [VerifyHeaderWidget()],
    );
  }
}
