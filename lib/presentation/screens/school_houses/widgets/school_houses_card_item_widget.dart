import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class SchoolHousesCardItemWidget extends StatelessWidget {
  final Widget icon;
  final Widget icon2;
  final bool hasIcon2;
  final String label;
  final String pointsValue;
  final String teachersValue;
  final String studentsValue;
  final Function()? onTap;

  const SchoolHousesCardItemWidget(
      {Key? key,
      required this.icon,
      required this.teachersValue,
      required this.pointsValue,
      required this.icon2,
      this.hasIcon2 = false,
      required this.label,
      required this.studentsValue,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  icon,
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MediumTextWidget(
                          text: label,
                          fontSize: 15,
                          color: ColorsManager.blackColor),
                      Expanded(child: const SizedBox()),
                      Visibility(visible: hasIcon2, child: icon2),
                    ],
                  ),
                  _line(),
                  _rowOfTitleAndValue(
                      title: S.of(context).students, value: studentsValue),
                  const SizedBox(height: 5),
                  _rowOfTitleAndValue(
                      title: S.of(context).teachers, value: teachersValue),
                  const SizedBox(
                    height: 16,
                  ),
                  _rowOfTitleAndValue(
                      title: S.of(context).points,
                      value: pointsValue,
                      valueSize: 17,
                      titleColor: ColorsManager.borderColor,
                      titleSize: 17),
                  SizedBox(
                    height: 8,
                  ),
                // RatingBar.builder(
                //   initialRating: 3,
                //   minRating: 1,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 5,
                //   itemSize: 20,
                //   wrapAlignment: WrapAlignment.center,
                //   glowRadius: 0.6,
                //   itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                //   itemBuilder: (context, _) => SvgPicture.asset(ImagesPath.ratingStarIcon,width: 18,height: 18,),
                //   onRatingUpdate: (rating) {
                //     print(rating);
                //   },
                // ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _rowOfTitleAndValue(
          {required String title,
          required String value,
          double valueSize = 15,
          Color titleColor = ColorsManager.titleGrayColor,
          double titleSize = 15}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          MediumTextWidget(
              text: value,
              fontSize: valueSize,
              color: ColorsManager.primaryColor),
          const SizedBox(
            width: 5,
          ),
          MediumTextWidget(
            text: title,
            fontSize: titleSize,
            color: titleColor,
          ),
        ],
      );

  Widget _line() => const Divider(
        thickness: 1,
        color: ColorsManager.grayColor,
        endIndent: 100,
      );
}
