import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/check_language_for_font_semi_bold_weight.dart';
import 'package:schools/core/utils/themes/font_family.dart';

class SemiBoldTextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final TextOverflow? textOverFlow;

  const SemiBoldTextWidget(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.textOverFlow,
      this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FontWeight>(
      initialData: FontFamily.fontWeightSemiBoldEnglish,
      future: languageFontSemiBoldWeight(),
      builder: (context, snapshot) => Text(
        text!,
        textAlign: textAlign,
        style: TextStyle(
          overflow: textOverFlow,
          fontWeight: snapshot.data,
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
