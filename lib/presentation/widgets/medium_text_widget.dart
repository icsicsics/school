import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/check_language_for_font_medium_weight.dart';
import 'package:schools/core/utils/themes/font_family.dart';

class MediumTextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign textAlign;
   final int maxLines;

  const MediumTextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.textAlign = TextAlign.start,
    this.maxLines = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FontWeight>(
      initialData: FontFamily.fontWeightMediumEnglish,
      future: languageFontMediumWeight(),
      builder: (context, snapshot) => Text(
        text!,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: snapshot.data,
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
