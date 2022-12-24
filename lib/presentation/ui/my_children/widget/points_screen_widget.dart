import 'package:flutter/material.dart';
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
            leading: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.star, color: ColorsManager.yellow, size: 22),
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
