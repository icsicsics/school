import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/check_language_for_font_bold_weight.dart';
import 'package:schools/core/utils/themes/font_family.dart';

class BoldTextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign textAlign;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;

  const BoldTextWidget(
      {Key? key,
      required this.text,
      required this.fontSize,
      required this.color,
      this.textAlign = TextAlign.start,
      this.textDecoration,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FontWeight>(
        initialData: FontFamily.fontWeightBoldEnglish,
        future: languageFontBoldWeight(),
        builder: (context, snapshot) => Text(
              text!,
              overflow: textOverflow,
              style: TextStyle(
                decoration: textDecoration,
                fontWeight: snapshot.data,
                color: color,
                fontSize: fontSize,
              ),
              textAlign: textAlign,
            ));
  }
}
