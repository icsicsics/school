import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';


class HomeFatherDetailsWidget extends StatelessWidget {
  const HomeFatherDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(),
        sizedBox(),
        _item(
            onTap: () {},
            title: "Honesty",
            subTitle:
            "17/09/2022 at 12:30 PM \n By Mrs. Tima Hamdallah - Math Teacher"),
        sizedBox(),
        _item(
            onTap: () {},
            title: "Collaboration",
            subTitle:
            "17/09/2022 at 12:30 PM \n By Mrs. Tima Hamdallah - Math Teacher"),
        sizedBox(),
        _item(
            onTap: () {},
            title: "Honesty",
            subTitle:
            "17/09/2022 at 12:30 PM \n By Mrs. Tima Hamdallah - Math Teacher"),
        sizedBox(),
      ],
    );
  }

  Widget _title() => Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Row(
      children: const [
        Icon(Icons.star, color: ColorsManager.yellow, size: 30),
        SizedBox(
          width: 5,
        ),
        MediumTextWidget(
            text: "16", fontSize: 15, color: ColorsManager.blackColor),
        SizedBox(
          width: 5,
        ),
        MediumTextWidget(
            text:
            "Interactive Values School \n5th Grade - Section 4 -  Collaboration Home",
            fontSize: 11,
            color: ColorsManager.blackColor),
      ],
    ),
  );

  Widget sizedBox() => const SizedBox(height: 8);

  Widget _item(
      {required Function() onTap,
        required String title,
        required String subTitle}) =>
      ListTile(
        leading: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border:
                Border.all(color: ColorsManager.mediumGrayColor, width: 1)),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.star, color: ColorsManager.yellow, size: 25),
            )),
        title: MediumTextWidget(
            text: title, fontSize: 15, color: ColorsManager.blackColor),
        subtitle: MediumTextWidget(
            text: subTitle, fontSize: 11, color: ColorsManager.darkGrayColor),
        onTap: onTap,
      );
}