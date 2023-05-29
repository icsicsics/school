import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schools/core/utils/awesome/name_icon_mapping.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';
import 'package:schools/presentation/widgets/regular_text_widget.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/resorces/color_manager.dart';

class PointsScreenWidget extends StatefulWidget {

  final List<Points> points;

  const PointsScreenWidget(
      {Key? key, required this.points})
      : super(key: key);

  @override
  State<PointsScreenWidget> createState() => _PointsScreenWidgetState();
}

class _PointsScreenWidgetState extends State<PointsScreenWidget> {
  List<Points> reversedPoints = [];
  String dateFormat(String dateFormat) {
    return DateFormat('dd/MM/yyyy').format(
      DateTime.parse(dateFormat).toLocal(),
    );
  }


  String formattedTime(String dateTime) {
    return DateFormat().add_jm().format(DateTime.parse(dateTime).toLocal());
  }


  @override
  void initState() {
    super.initState();
    widget.points.sort((a, b) => b.creationDate!.compareTo(a.creationDate!));
  }

  @override
  void didUpdateWidget(covariant PointsScreenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.points.sort((a, b) => b.creationDate!.compareTo(a.creationDate!));
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.points
            .map((e) {
              return _item(
                onTap: () {},
                  title: getValueName(e),
                subTitle:
                    "${dateFormat(e.creationDate.toString())}  ${S.of(context).at}  ${formattedTime(e.creationDate.toString())}",
                description: e.createdByName??"",
                icon: getIconFromCss(e.principleIcon ?? ""));
            })
            .toList(),
      ),
    );
  }

  String getValueName(Points point) {
    if (point.valueName?.toLowerCase() == "others" ||
        point.valueName?.toLowerCase() == "اخرى" ||
        point.valueName?.toLowerCase() == "أخرى") {
      return point.description ?? "";
    }

    return point.valueName ?? "";
  }

  Widget _item(
          {required Function() onTap,
          required String title,
          required String subTitle,
          required String description,
          required IconData icon}) =>
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: ColorsManager.whiteColor,
                            border: Border.all(
                                color: ColorsManager.borderLight, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        child: const Padding(
                            padding: EdgeInsets.all(2),
                            child:
                                Icon(Icons.star, color: ColorsManager.yellow))),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MediumTextWidget(
                            text: title,
                            fontSize: 15,
                            color: ColorsManager.sameBlack),
                        const SizedBox(height: 5),
                        RegularTextWidget(
                            text: subTitle,
                            fontSize: 11,
                            color: ColorsManager.subTitle),
                        const SizedBox(height: 5),
                        RegularTextWidget(
                            text: "${S.of(context).By} $description",
                            fontSize: 11,
                            color: ColorsManager.subTitle),
                      ],
                    ),
                  ),
                  FaIcon(icon, color: ColorsManager.secondaryColor, size: 30)
                ],
              )));
}
