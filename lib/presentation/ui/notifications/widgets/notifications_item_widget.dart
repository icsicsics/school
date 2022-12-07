import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';

class NotificationsItemWidget extends StatelessWidget {
  const NotificationsItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Icon(
                Icons.notifications,
                color: ColorsManager.yellow,
                size: 26,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                  BoldTextWidget(
                      text: "Leen Got New Point for Honesty by Dr. Yazan",
                      fontSize: 14,
                      color: ColorsManager.blackColor),
                  BoldTextWidget(
                      text: "17/09/2022 at 12:30 PM",
                      fontSize: 12,
                      color: ColorsManager.blackColor)
                ],),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
