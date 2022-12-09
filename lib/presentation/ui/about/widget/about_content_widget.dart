import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/about/widget/about_header_widget.dart';

class AboutContentWidget extends StatefulWidget {
  const AboutContentWidget({Key? key}) : super(key: key);

  @override
  State<AboutContentWidget> createState() => _AboutContentWidgetState();
}

class _AboutContentWidgetState extends State<AboutContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AboutHeaderWidget()
      ],
    );
  }
}
