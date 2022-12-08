import 'package:flutter/material.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

import '../../../../core/utils/resorces/color_manager.dart';

class HousesWidget extends StatefulWidget {
  const HousesWidget({Key? key}) : super(key: key);

  @override
  State<HousesWidget> createState() => _HousesWidgetState();
}

class _HousesWidgetState extends State<HousesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _item(onTap: (){}, title: "Energetic", subTitle: "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher"),
          _item(onTap: (){}, title: "Collaboration", subTitle: "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher"),
          _item(onTap: (){}, title: "Initiative", subTitle: "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher"),
          _item(onTap: (){}, title: "Collaboration", subTitle: "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher"),
          _item(onTap: (){}, title: "Energetic", subTitle: "17/09/2022  at 12:30 PM\n By Mrs. Tima Hamdallah - Math Teacher"),
        ],
      ),
    );
  }

  Widget _item(
          {required Function() onTap,
          required String title,
          required String subTitle}) =>
      Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ListTile(
              leading:
                  const Icon(Icons.star, color: ColorsManager.yellow, size: 30),
              title: MediumTextWidget(
                  text: title, fontSize: 15, color: ColorsManager.blackColor),
              subtitle: MediumTextWidget(
                  text: subTitle,
                  fontSize: 11,
                  color: ColorsManager.grayColor),
              trailing: const Icon(Icons.power_settings_new_rounded,
                  color: ColorsManager.primaryColor, size: 30),
              onTap: onTap,
            ),
          ));
}
