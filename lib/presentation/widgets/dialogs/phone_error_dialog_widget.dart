import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/custom_button_widget.dart';

class PhoneErrorDialogWidget extends StatefulWidget {
  final String textMessage;
  final String language ;
  const PhoneErrorDialogWidget({
    Key? key,
    required this.textMessage,
    required this.language,
  }) : super(key: key);

  @override
  State<PhoneErrorDialogWidget> createState() => _PhoneErrorDialogWidgetState();
}

class _PhoneErrorDialogWidgetState extends State<PhoneErrorDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: widget.language == "ar" ? 310 : 370,
        decoration: const BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              ImagesPath.phoneError,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: BoldTextWidget(
                  text: widget.textMessage,
                  fontSize: 16,
                  height: 2,
                  textAlign: TextAlign.center,
                  color: ColorsManager.darkGrayColor),
            ),
            SizedBox(
              height: 16,
            ),
            CustomButtonWidget(
                buttonWidth: MediaQuery.of(context).size.width / 3,
                onPressed: () => Navigator.pop(context),
                buttonText: S.of(context).phoneErrorOk,
                borderRadius: 25,
                buttonColor: ColorsManager.secondaryColor,
                borderColor: ColorsManager.secondaryColor,
                buttonTextColor: ColorsManager.whiteColor),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
