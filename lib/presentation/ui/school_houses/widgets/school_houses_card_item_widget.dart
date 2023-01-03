import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/school_houses/school_houses_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class SchoolHousesCardItemWidget extends StatelessWidget {
  final Widget icon;
  final Widget icon2;
  final bool hasIcon2;
  final String label;
  final String pointsValue;
  final String teachersValue;
  final String studentsValue;

  const SchoolHousesCardItemWidget(
      {Key? key,
      required this.icon,
      required this.teachersValue,
      required this.pointsValue,
      required this.icon2,
      this.hasIcon2 = false,
      required this.label,
      required this.studentsValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
        child: InkWell(
          onTap: () => BlocProvider.of<SchoolHousesBloc>(context)
              .add(NavigateToAddPointsScreenEvent()),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
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
                          const SizedBox(width: 20),
                          Visibility(visible: hasIcon2, child: icon2),
                        ],
                      ),
                      _line(),
                      _rowOfTitleAndValue(
                          title: S.of(context).students, value: studentsValue),
                      _rowOfTitleAndValue(
                          title: S.of(context).teachers, value: teachersValue),
                      const SizedBox(
                        height: 30,
                      ),
                      _rowOfTitleAndValue(
                          title: S.of(context).points,
                          value: pointsValue,
                          valueSize: 17,
                          titleColor: ColorsManager.borderColor,
                          titleSize: 17),
                    ],
                  ))),
        ));
  }

  Widget _rowOfTitleAndValue(
          {required String title,
          required String value,
          double valueSize = 15,
          Color titleColor = ColorsManager.titleGrayColor,
          double titleSize = 15}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
