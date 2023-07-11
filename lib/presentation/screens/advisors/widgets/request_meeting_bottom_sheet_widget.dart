import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:schools/config/utils/android_date_picker.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/advisors/request/create_meeting_request.dart';
import 'package:schools/data/source/remote/model/advisors/response/guide.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/advisors/advisors_bloc.dart';
import 'package:schools/presentation/widgets/dialogs/show_error_dialg_function.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

class RequestMeetingBottomSheetWidget extends StatefulWidget {
  final double height;
  final List<Guide> guides;
  final String studentId;
  final String teacherId;
  final String classroomToSectionId;

  const RequestMeetingBottomSheetWidget({
    Key? key,
    required this.height,
    required this.guides,
    required this.studentId,
    required this.teacherId,
    required this.classroomToSectionId,
  }) : super(key: key);

  @override
  State<RequestMeetingBottomSheetWidget> createState() =>
      _RequestMeetingBottomSheetWidgetState();
}

class _RequestMeetingBottomSheetWidgetState
    extends State<RequestMeetingBottomSheetWidget> {
  DateTime selectedDate = DateTime.now();
  Guide selectedGuide = Guide();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdvisorsBloc, AdvisorsState>(
      listener: (context, state) {
        if (state is ShowLoadingState) {
          // showLoading();
        } else if (state is HideLoadingState) {
          // hideLoading();
        } else if (state is CreateMeetingSuccessState) {
          showErrorDialogFunction(
              context: context,
              textMessage: state.message,
              onPressed: () => Navigator.pop(context));
        } else if (state is CreateMeetingErrorState) {
          showErrorDialogFunction(
              context: context, textMessage: state.errorMessage);
        } else if (state is NavigateBackState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: 510,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      S.of(context).advisors,
                      style: TextStyle(
                        color: Color.fromRGBO(34, 34, 34, 1),
                        letterSpacing: -0.14,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset(
                        ImagesPath.closeIcon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.guides.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              widget.guides[index].isSelected =
                                  (widget.guides[index].isSelected == true)
                                      ? false
                                      : true;
                              if (widget.guides[index].isSelected == true) {
                                selectedGuide = widget.guides[index];
                              } else {
                                selectedGuide = Guide();
                              }
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        widget.guides[index].isSelected ?? false
                                            ? Color.fromRGBO(59, 187, 172, 1)
                                            : Colors.transparent,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 6),
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                            ImagesPath.advisorPlaceHolder,
                                          ),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.guides[index].guideName ?? "",
                                  style: TextStyle(
                                    color:
                                        widget.guides[index].isSelected == false
                                            ? Color.fromRGBO(34, 34, 34, 1)
                                            : Color.fromRGBO(59, 187, 172, 1),
                                    letterSpacing: -0.13,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Text(
                      S.of(context).dateAndTime,
                      style: TextStyle(
                        color: Color.fromRGBO(34, 34, 34, 1),
                        letterSpacing: -0.14,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () async {
                        var chosenDateTime = await androidDatePicker(
                          context: context,
                          selectedDate: selectedDate,
                        );
                        if (chosenDateTime != null)
                          setState(() {
                            selectedDate = chosenDateTime;
                          });
                      },
                      child: SvgPicture.asset(
                        ImagesPath.calendar,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () async {
                        var chosenDateTime = await androidDatePicker(
                          context: context,
                          selectedDate: selectedDate,
                        );
                        if (chosenDateTime != null)
                          setState(() {
                            selectedDate = chosenDateTime;
                          });
                      },
                      child: Text(
                        DateFormat("dd-MM-yyyy")
                            .format(selectedDate ?? DateTime.now()),
                        style: TextStyle(
                          color: Color(0xFFF39A4A),
                          letterSpacing: -0.14,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 115,
                  child: Row(
                    children: [
                      Expanded(
                          child: WheelChooser(
                        onValueChanged: (i) => print(i),
                        datas: ["PM", "AM"],
                        perspective: 0.002,
                        squeeze: 1.3,
                        unSelectTextStyle: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 0.4),
                            fontSize: 11),
                        startPosition: 0,
                        selectTextStyle: TextStyle(
                            color: ColorsManager.primaryColor, fontSize: 11),
                      )),
                      Expanded(
                          child: WheelChooser.integer(
                        onValueChanged: (i) => print(i),
                        maxValue: 12,
                        minValue: 1,
                        listHeight: 115,
                        perspective: 0.002,
                        step: 1,
                        squeeze: 1.3,
                        unSelectTextStyle: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 0.4),
                            fontSize: 11),
                        initValue: (DateTime.now().hour % 12) + 1,
                        selectTextStyle: TextStyle(
                            color: ColorsManager.primaryColor, fontSize: 11),
                      )),
                      Expanded(
                          child: WheelChooser.integer(
                        onValueChanged: (i) => print(i),
                        maxValue: 60,
                        minValue: 1,
                        listHeight: 115,
                        perspective: 0.002,
                        step: 1,
                        squeeze: 1.3,
                        unSelectTextStyle: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 0.4),
                            fontSize: 11),
                        initValue: DateTime.now().minute,
                        selectTextStyle: TextStyle(
                            color: ColorsManager.primaryColor, fontSize: 11),
                      )),
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                          child: WheelChooser(
                        onValueChanged: (i) => print(i),
                        datas: ["PM", "AM"],
                        perspective: 0.002,
                        squeeze: 1.3,
                        unSelectTextStyle: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 0.4),
                            fontSize: 11),
                        startPosition: 0,
                        selectTextStyle: TextStyle(
                            color: ColorsManager.primaryColor, fontSize: 11),
                      )),
                      Expanded(
                          child: WheelChooser.integer(
                        onValueChanged: (i) => print(i),
                        maxValue: 12,
                        minValue: 1,
                        listHeight: 115,
                        perspective: 0.002,
                        step: 1,
                        squeeze: 1.3,
                        unSelectTextStyle: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 0.4),
                            fontSize: 11),
                        initValue: (DateTime.now().hour % 12) + 1,
                        selectTextStyle: TextStyle(
                            color: ColorsManager.primaryColor, fontSize: 11),
                      )),
                      Expanded(
                          child: WheelChooser.integer(
                        onValueChanged: (i) => print(i),
                        maxValue: 60,
                        minValue: 1,
                        listHeight: 115,
                        perspective: 0.002,
                        step: 1,
                        squeeze: 1.3,
                        unSelectTextStyle: TextStyle(
                            color: Color.fromRGBO(34, 34, 34, 0.4),
                            fontSize: 11),
                        initValue: DateTime.now().minute,
                        selectTextStyle: TextStyle(
                            color: ColorsManager.primaryColor, fontSize: 11),
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 45,
                  color: Color.fromRGBO(34, 34, 34, 0.1),
                  child: Row(
                    children: [
                      SizedBox(width: 64),
                      Text(
                        S.of(context).from,
                        style: TextStyle(
                          color: ColorsManager.blackColor,
                          letterSpacing: -0.14,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        S.of(context).to,
                        style: TextStyle(
                          color: ColorsManager.blackColor,
                          letterSpacing: -0.14,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 64),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedGuide.guideId == null) {
                          showErrorDialogFunction(
                            context: context,
                            textMessage: "Please select a guide",
                          );
                        } else {
                          CreateMeetingRequest request = CreateMeetingRequest(
                            guideId: selectedGuide.guideId,
                            studentId: widget.studentId,
                            // meetingTime: selectedDate.toUtc().toString(),
                            meetingTime: "2023-07-12T11:52:17Z",
                            classroomToSectionId: widget.classroomToSectionId,
                            teacherId: widget.teacherId,
                          );
                          BlocProvider.of<AdvisorsBloc>(context)
                              .add(CreateMeetingEvent(request: request));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(59, 187, 172, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: -0.14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
