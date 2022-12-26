import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

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
              subTitle:
                  "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher",
              icon: Icons.energy_savings_leaf),
          _item(
              onTap: () {},
              title: S.of(context).collaboration,
              subTitle:
                  "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher",
              icon: Icons.autorenew_rounded),
          _item(
              onTap: () {},
              title: S.of(context).initiative,
              subTitle:
                  "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher",
              icon: Icons.lightbulb_outline_rounded),
          _item(
              onTap: () {},
              title: S.of(context).collaboration,
              subTitle:
                  "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher",
              icon: Icons.autorenew_rounded),
        ],
      ),
    );
  }

  Widget _item(
          {required Function() onTap,
          required String title,
          required String subTitle,
          required IconData icon}) =>
      Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          child: ListTile(
            contentPadding:
                const EdgeInsets.only(top: 3, bottom: 3, right: 15, left: 15),
            dense: true,
            style: ListTileStyle.list,
            minLeadingWidth: 2,
            leading:  Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: ColorsManager.whiteColor,
                      border: Border.all(color: ColorsManager.borderLight, width: 1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(40))),
                  child: const Padding(
                      padding:  EdgeInsets.all(2),
                      child: Icon(
                          Icons.star, color: ColorsManager.yellow))),
            ),
            title: MediumTextWidget(
                text: title, fontSize: 15, color: ColorsManager.darkGrayColor),
            subtitle: MediumTextWidget(
                text: subTitle,
                fontSize: 11,
                color: ColorsManager.welcomeGryColor),
            trailing: Icon(icon, color: ColorsManager.secondaryColor, size: 30),
            onTap: onTap,
          ));
}
