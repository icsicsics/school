import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/father_point/request/father_add_point_request.dart';
import 'package:schools/data/source/remote/model/father_point/response/father_add_point_response.dart';
import 'package:schools/data/source/remote/model/teacher_point/request/teacher_add_point_request.dart';
import 'package:schools/data/source/remote/model/teacher_point/response/teacher_add_point_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/shere_widgets/custom_button_widget.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/get_teacher_principl_by_classroom_Id_response.dart';
import 'package:schools/data/source/remote/model/teacher_principl_by_classroomId/data.dart';

class AddPointDialogWidget extends StatefulWidget {
  final bool isGift;
  final String childName;
  final String token;
  final String classroomId;
  final bool isParent;
  final String classroomSectionStudentsId;
  final String studentId;
  final Function() onCreatePointSuccess;

  const AddPointDialogWidget(
      {Key? key,
      required this.childName,
      required this.classroomId,
      required this.token,
      this.isParent = false,
      required this.studentId,
      required this.classroomSectionStudentsId,
      required this.onCreatePointSuccess,
      this.isGift = false})
      : super(key: key);

  @override
  State<AddPointDialogWidget> createState() => _AddPointDialogWidgetState();
}

class _AddPointDialogWidgetState extends State<AddPointDialogWidget> {
  TextEditingController commentController = TextEditingController();
  String? dropdownValue;
  bool isAddCommit = false;
  GetTeacherPrinciplByClassroomIdResponse
      _getTeacherPrinciplByClassroomIdResponse =
      GetTeacherPrinciplByClassroomIdResponse();
  Data value = Data();

  AddPointBloc get _addPointBloc => BlocProvider.of<AddPointBloc>(context);

  final List<Data> _listOfItems = [];

  @override
  void initState() {
    if (widget.classroomId.trim().isNotEmpty) {
      _addPointBloc.add(GetAddPointEvent(
          token: widget.token, classroomId: widget.classroomId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPointBloc, AddPointState>(
      listener: (context, state) {
        if (state is AddPointLoadingState) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (_) => const Center(child: CircularProgressIndicator()));
        } else if (state is GetTeacherPrinciplByClassroomIdSuccessState) {
          _onGetTeacherPrinciplByClassroomIdSuccessState(state.response);
        } else if (state is GetTeacherPrinciplByClassroomIdFillState) {
          _onGetTeacherPrinciplByClassroomIdFillState(state.error);
        } else if (state is PostTeacherCreatePointSuccessState) {
          _onPostTeacherCreatePointSuccessState(state.response);
        } else if (state is PostTeacherCreatePointFailState) {
          _onPostTeacherCreatePointFailState(state.error);
        } else if (state is PostFatherCreatePointSuccessState) {
          _onPostFatherCreatePointSuccessState(state.response);
        } else if (state is PostFatherCreatePointFailState) {
          _onPostFatherCreatePointFailState(state.error);
        }
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
                      items: _listOfItems
                          .map((e) => DropdownMenuItem(
                                value: e.id,
                                child: Text(e.name.toString(),
                                    style: const TextStyle(
                                        color: ColorsManager.sameBlack)),
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        setState(() {
                          if (newValue ==
                              "fcf984cb-15de-4433-af09-6b3b1b1ff8b7") {
                            isAddCommit = true;
                          } else {
                            isAddCommit = false;
                            _addValue(newValue);
                          }
                          dropdownValue = newValue ?? "";
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
                            controller: commentController,
                            onChanged: (value1) {
                              value = Data(
                                  name: value1,
                                  id: "b64ff3c8-e98e-4e54-93d7-9f11d0256449");
                            },
                          ),
                        ))),
                SizedBox(
                  height: isAddCommit ? 15 : 5,
                ),
                CustomButtonWidget(
                    buttonWidth: MediaQuery.of(context).size.width / 4,
                    onPressed: () {
                      _onAddPoint();
                    },
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

  void _onGetTeacherPrinciplByClassroomIdFillState(String error) =>
      showErrorDialogFunction(context: context, textMessage: error);

  void _onGetTeacherPrinciplByClassroomIdSuccessState(
      GetTeacherPrinciplByClassroomIdResponse response) {
    _getTeacherPrinciplByClassroomIdResponse = response;
    for (var element in _getTeacherPrinciplByClassroomIdResponse.data!) {
      _listOfItems.add(element);
      // _listOfItems.sort((A, B) => A.name
      //     .toString()
      //     .toUpperCase()
      //     .compareTo(B.name.toString().toUpperCase()));

    }
    Navigator.pop(context);
  }

  void _addValue(String? newValue) {
    for (var element in _listOfItems) {
      if (element.id == newValue) {
        value = element;
      }
    }
  }

  void _onAddPoint() {
    Navigator.of(context);
    if (value.id != null) {
      if (widget.isParent == false) {
        print(value.id);
        _addPointBloc.add(PostTeacherAddPointEvent(
            token: widget.token,
            request: TeacherAddPointRequest(
                classroomSectionStudentsId: widget.classroomSectionStudentsId,
                classroomToPrinciplesId: value.id,
                studentId: widget.studentId,
                description: value.name)));
      } else {
        _addPointBloc.add(PostFatherAddPointEvent(
            token: widget.token,
            request: FatherAddPointRequest(
                classroomSectionStudentsId: widget.classroomSectionStudentsId,
                classroomToPrinciplesId: value.id,
                studentId: widget.studentId,
                description: value.name)));
      }
    } else {
      showErrorDialogFunction(
          context: context,
          textMessage: S.of(context).pleaseSelectWhyThisPointFirst);
    }
  }

  void _onPostTeacherCreatePointSuccessState(TeacherAddPointResponse response) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    showErrorDialogFunction(
            isGift: true,
            context: context,
            textMessage: response.data.toString())
        .then((value) {
      widget.onCreatePointSuccess();
    });
  }

  void _onPostTeacherCreatePointFailState(String error) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    showErrorDialogFunction(context: context, textMessage: error);
  }

  void _onPostFatherCreatePointSuccessState(FatherAddPointResponse response) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    showErrorDialogFunction(
            isGift: true,
            context: context,
            textMessage: response.data.toString())
        .then((value) {
      widget.onCreatePointSuccess();
    });
  }

  void _onPostFatherCreatePointFailState(String error) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    showErrorDialogFunction(context: context, textMessage: error);
  }
}
