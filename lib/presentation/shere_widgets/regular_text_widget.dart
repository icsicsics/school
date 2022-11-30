import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/check_language_for_font_regular_weight.dart';
import 'package:schools/core/utils/themes/font_family.dart';


class RegularTextWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final TextAlign textAlign;
  final TextOverflow? textOverflow;

  const RegularTextWidget({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.color,
    this.textOverflow,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FontWeight>(
        initialData: FontFamily.fontWeightRegularEnglish,
        future: languageFontRegularWeight(),
        builder: (context, snapshot) => Text(
              text!,
              overflow: textOverflow,
              textAlign: textAlign,
              style: TextStyle(
                overflow: textOverflow,
                fontWeight: snapshot.data,
                color: color,
                fontSize: fontSize,
              ),
            ));
  }
}
