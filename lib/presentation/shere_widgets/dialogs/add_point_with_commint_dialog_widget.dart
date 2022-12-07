import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class AddPointDialogWidget extends StatefulWidget {
  final Function() addAction;
  final TextEditingController addController;

  const AddPointDialogWidget(
      {Key? key, required this.addAction, required this.addController})
      : super(key: key);

  @override
  State<AddPointDialogWidget> createState() => _AddPointDialogWidgetState();
}

class _AddPointDialogWidgetState extends State<AddPointDialogWidget> {
  String dropdownValue = 'Item 1';
  bool showCommint = false;
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'other',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 280,
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
            const Icon(Icons.star, size: 40, color: ColorsManager.yellow),
            const BoldTextWidget(
                text: "Add Point",
                fontSize: 14,
                color: ColorsManager.darkGrayColor),
            const SizedBox(
              height: 5,
            ),
           const  MediumTextWidget(
                text: "Choose Why Leen Desrive this point",
                fontSize: 12,
                color: ColorsManager.blackColor),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      value: dropdownValue,
                      isExpanded: true,

                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 27,
                        color: ColorsManager.secondaryColor,
                      ),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          if (newValue == 'other') {
                            showCommint = true;
                          } else {
                            showCommint = false;
                          }
                          dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showCommint,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: widget.addController,
                  decoration: const InputDecoration(
                      hintText: "Other", hintStyle: TextStyle(fontSize: 14)),
                ),
              ),
            ),
            Visibility(
              visible: showCommint,
              child: const SizedBox(
                height: 20,
              ),
            ),
            CustomButtonWidget(
                buttonWidth: MediaQuery.of(context).size.width / 4,
                onPressed: widget.addAction,
                buttonText: "Add",
                borderRadius: 25,
                buttonColor: ColorsManager.buttonColor,
                borderColor: ColorsManager.buttonColor,
                buttonTextColor: ColorsManager.whiteColor),
          ],
        ));
  }
}
