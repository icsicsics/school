import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/custom_button_widget.dart';

class ErrorDialogWidget extends StatefulWidget {
  final String textMessage;
  final bool isGift;
  final Function()? onPressed;

  const ErrorDialogWidget({
    Key? key,
    required this.textMessage,
    this.isGift = false,
    this.onPressed,
  }) : super(key: key);

  @override
  State<ErrorDialogWidget> createState() => _ErrorDialogWidgetState();
}

class _ErrorDialogWidgetState extends State<ErrorDialogWidget> {
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
            Visibility(
                visible: widget.isGift,
                child: const Icon(Icons.card_giftcard,
                    size: 40, color: ColorsManager.yellow)),
            SizedBox(
              height: widget.isGift ? 10 : 35,
            ),
            BoldTextWidget(
                text: widget.textMessage,
                fontSize: 16,
                color: ColorsManager.darkGrayColor),
            const Spacer(),
            CustomButtonWidget(
                buttonWidth: MediaQuery.of(context).size.width / 3,
                onPressed: () {
                  Navigator.pop(context);
                  if (widget.onPressed != null) {
                    widget.onPressed!();
                  }
                },
                buttonText: S.of(context).ok,
                borderRadius: 25,
                buttonColor: ColorsManager.secondaryColor,
                borderColor: ColorsManager.secondaryColor,
                buttonTextColor: ColorsManager.whiteColor),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
