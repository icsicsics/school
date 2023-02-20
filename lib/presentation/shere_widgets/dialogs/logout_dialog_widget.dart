import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';

class LogoutDialogWidget extends StatefulWidget {
  final Function() yes;
  const LogoutDialogWidget(
      {Key? key,
        required this.yes})
      : super(key: key);

  @override
  State<LogoutDialogWidget> createState() => _LogoutDialogWidgetState();
}

class _LogoutDialogWidgetState extends State<LogoutDialogWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        decoration: const BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            BoldTextWidget(
                text: S.of(context).areYouSure,
                fontSize: 16,
                color: ColorsManager.darkGrayColor),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              CustomButtonWidget(
                  buttonWidth: MediaQuery.of(context).size.width / 3,
                  onPressed: ()=>Navigator.pop(context),
                  buttonText: S.of(context).no,
                  borderRadius: 25,
                  buttonColor: ColorsManager.whiteColor,
                  borderColor: ColorsManager.subTitle,
                  buttonTextColor: ColorsManager.subTitle
                ),
              CustomButtonWidget(
                  buttonWidth: MediaQuery.of(context).size.width / 3,
                  onPressed:widget.yes,
                  buttonText: S.of(context).yes,
                  borderRadius: 25,
                  buttonColor: ColorsManager.buttonColor,
                  borderColor: ColorsManager.buttonColor,
                  buttonTextColor: ColorsManager.whiteColor),
            ],)

          ],
        ));
  }
}
