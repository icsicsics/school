import 'package:flutter/material.dart';

import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';
import 'package:schools/presentation/shere_widgets/regular_text_widget.dart';

class OkDialogImageWidget extends StatelessWidget {
  final String? textMessage;
  final BuildContext? context;
  final Function() onTap;

  const OkDialogImageWidget({
    Key? key,
    required this.textMessage,
    required this.context,
    required this.onTap,
  }) : super(key: key);

  Decoration? _customDecoration() {
    return const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: double.infinity,
            height: 200,
            decoration: _customDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: RegularTextWidget(
                    textAlign: TextAlign.center,
                    color: Colors.black,
                    fontSize: 16,
                    text: textMessage ?? "",
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButtonWidget(
                  onPressed: onTap,
                  buttonText: S.of(context).ok,
                  buttonWidth: MediaQuery.of(context).size.width * 0.8,
                  buttonHeight: 50,
                  buttonColor: ColorsManager.primaryColor,
                  borderColor: ColorsManager.primaryColor,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(bottom: 180),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: Image.asset(
              ImagesPath.logo,
              fit: BoxFit.fill,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}
