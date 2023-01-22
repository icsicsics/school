import 'package:flutter/material.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/shere_widgets/regular_text_widget.dart';

import '../../../../core/utils/resorces/color_manager.dart';

class PointsScreenWidget extends StatefulWidget {
  const PointsScreenWidget({Key? key}) : super(key: key);

  @override
  State<PointsScreenWidget> createState() => _PointsScreenWidgetState();
}

class _PointsScreenWidgetState extends State<PointsScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _item(
              onTap: () {},
              title: S.of(context).energetic,
              subTitle: "17/09/2022  at 12:30 PM",
              description: 'By Mrs. Tima Hamdallah - Math Teacher',
              icon: Icons.energy_savings_leaf),
          _item(
              onTap: () {},
              title: S.of(context).collaboration,
              subTitle: "17/09/2022  at 12:30 PM",
              description: 'By Mrs. Tima Hamdallah - Math Teacher',
              icon: Icons.autorenew_rounded),
          _item(
              onTap: () {},
              title: S.of(context).initiative,
              subTitle: "17/09/2022  at 12:30 PM",
              icon: Icons.lightbulb_outline_rounded,
              description: 'By Mrs. Tima Hamdallah - Math Teacher'),
          _item(
              onTap: () {},
              title: S.of(context).collaboration,
              subTitle: "17/09/2022  at 12:30 PM",
              icon: Icons.autorenew_rounded,
              description: 'By Mrs. Tima Hamdallah - Math Teacher'),
        ],
      ),
    );
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
                            text: description,
                            fontSize: 11,
                            color: ColorsManager.subTitle),
                      ],
                    ),
                  ),
                  Icon(icon, color: ColorsManager.secondaryColor, size: 30)
                ],
              )));
}