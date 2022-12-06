import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class SchoolHousesCardItemWidget extends StatelessWidget {
  const SchoolHousesCardItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 0,
            child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.manage_accounts),
                    Row(
                      children: const [
                        Expanded(
                          child: MediumTextWidget(
                              text: "Appreciative",
                              fontSize: 15,
                              color: ColorsManager.blackColor),
                        ),
                        Icon(
                          Icons.account_circle,
                          color: ColorsManager.yellow,
                        ),
                      ],
                    ),
                    const MediumTextWidget(
                        text: "---------",
                        fontSize: 15,
                        color: ColorsManager.blackColor),
                    const MediumTextWidget(
                        text: "20 Students",
                        fontSize: 15,
                        color: ColorsManager.blackColor),
                    const MediumTextWidget(
                        text: "6 teachers",
                        fontSize: 15,
                        color: ColorsManager.blackColor),
                    const SizedBox(
                      height: 15,
                    ),
                    const MediumTextWidget(
                        text: "172 Points",
                        fontSize: 15,
                        color: ColorsManager.blackColor),
                  ],
                ))));
  }
}
