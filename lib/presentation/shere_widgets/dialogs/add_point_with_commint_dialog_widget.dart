import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class AddPointDialogWidget extends StatefulWidget {
  final Function() addAction;
  final String childName;
  final TextEditingController commentController;
  final String token;
  final String classroomId;

  const AddPointDialogWidget(
      {Key? key,
      required this.addAction,
      required this.childName,
      required this.commentController,
      required this.classroomId,
      required this.token})
      : super(key: key);

  @override
  State<AddPointDialogWidget> createState() => _AddPointDialogWidgetState();
}

class _AddPointDialogWidgetState extends State<AddPointDialogWidget> {
  String? dropdownValue;
  bool isAddCommit = false;

  AddPointBloc get _addPointBloc => BlocProvider.of<AddPointBloc>(context);
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'other',
  ];

  @override
  void initState() {
    if (widget.classroomId != null) {
      _addPointBloc.add(GetAddPointEvent(
          token: widget.token, classroomId: widget.classroomId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPointBloc, AddPointState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
            width: double.infinity,
            height: isAddCommit == true ? 265 : 200,
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
                const Icon(Icons.star, size: 40, color: ColorsManager.yellow),
                BoldTextWidget(
                    text: S.of(context).addPoint,
                    fontSize: 14,
                    color: ColorsManager.darkGrayColor),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 50,
                    child: DropdownButton(
                      isExpanded: true,
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                        color: ColorsManager.secondaryColor,
                      ),
                      hint: MediumTextWidget(
                          textAlign: TextAlign.center,
                          text:
                              "${S.of(context).chooseWhyLeenDeserveThisPoint} to ${widget.childName}",
                          fontSize: 11,
                          color: ColorsManager.sameBlack),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items,
                              style: const TextStyle(
                                  color: ColorsManager.sameBlack)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          dropdownValue = newValue ?? "";
                          if (newValue == "other") {
                            isAddCommit = true;
                          } else {
                            isAddCommit = false;
                          }
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                    visible: isAddCommit,
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                                isDense: true,
                                focusColor: ColorsManager.primaryColor,
                                hintText:
                                    S.of(context).typeWhyLeenDeserveThisPoint,
                                hintStyle: const TextStyle(
                                    fontSize: 13,
                                    color: ColorsManager.sameBlack)),
                            controller: widget.commentController,
                          ),
                        ))),
                SizedBox(
                  height: isAddCommit ? 15 : 5,
                ),
                CustomButtonWidget(
                    buttonWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: widget.addAction,
                    buttonText: S.of(context).reward,
                    borderRadius: 25,
                    buttonColor: ColorsManager.buttonColor,
                    borderColor: ColorsManager.buttonColor,
                    buttonTextColor: ColorsManager.whiteColor),
              ],
            ));
      },
    );
  }
}
