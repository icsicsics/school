import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';

class AddPointDialogWidget extends StatelessWidget {
  final Function() addAction;
  final TextEditingController addController;

  const AddPointDialogWidget(
      {Key? key, required this.addAction, required this.addController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Icon(Icons.star, size: 40, color: Colors.orange),
            const BoldTextWidget(
                text: "Add Points",
                fontSize: 14,
                color: ColorsManager.darkGrayColor),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: addController,
                decoration: const InputDecoration(
                    hintText: "Choose Why Leen Desrive this point"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWidget(
                buttonWidth: MediaQuery.of(context).size.width / 4,
                onPressed: addAction,
                buttonText: "Add",
                borderRadius: 25,
                buttonColor: ColorsManager.buttonColor,
                borderColor: ColorsManager.buttonColor,
                buttonTextColor: ColorsManager.whiteColor),
          ],
        ));
  }
}
