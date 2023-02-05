import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/card_widget.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
import 'package:schools/presentation/ui/school_houses/school_houses_screen.dart';

class HomeTeacherDetailsWidget extends StatefulWidget {
  final String token;
  final GetTeacherHomeResponse teacherHomeResponse;
  final String language;
  final HomeBloc homeBloc;

  const HomeTeacherDetailsWidget(
      {Key? key,
      required this.teacherHomeResponse,
      required this.token,
      required this.language,
      required this.homeBloc})
      : super(key: key);

  @override
  State<HomeTeacherDetailsWidget> createState() =>
      _HomeTeacherDetailsWidgetState();
}

class _HomeTeacherDetailsWidgetState extends State<HomeTeacherDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.teacherHomeResponse.data != null
        ? Column(
            children: [
              const SizedBox(height: 2),
              Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      ColorsManager.primaryColor,
                      ColorsManager.secondaryColor,
                    ],
                    stops: [0.5, 0.8],
                  )),
                  height: 50,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Row(
                        children: [
                          widget
                              .homeBloc.teacherInfoResponse.data!=null?MediumTextWidget(
                              text: widget
                                  .homeBloc.teacherInfoResponse.data!.houseName,
                              fontSize: 16,
                              color: ColorsManager.whiteColor):Container(),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SchoolHousesScreen(
                                        token: widget.token,
                                        classRoomId: widget
                                            .homeBloc
                                            .teacherInfoResponse
                                            .data!
                                            .branchId!,
                                        language: widget.language, isComingFromHome: true))),
                            child:  MediumTextWidget(
                                text: S.of(context).viewHouses,
                                fontSize: 16,
                                color: ColorsManager.whiteColor),
                          ),
                        ],
                      ))),
              GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, mainAxisExtent: 210),
                itemCount:
                    widget.teacherHomeResponse.data!.teacherHomePage!.length,
                padding: const EdgeInsets.all(5),
                shrinkWrap: true,
                semanticChildCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SchoolHousesScreen(
                                      token: widget.token,
                                      classRoomId: widget
                                          .teacherHomeResponse
                                          .data!
                                          .teacherHomePage![index]
                                          .classroomToSectionId!,
                                      language: widget.language, isComingFromHome: false,
                                    )));
                      },
                      child: CardWidget(
                        section: widget.teacherHomeResponse.data!
                            .teacherHomePage![index].classroomName!,
                        imagePath: widget.teacherHomeResponse.data!
                            .teacherHomePage![index].getLogo!.mediaUrl
                            .toString(),
                        grade: widget.teacherHomeResponse.data!
                            .teacherHomePage![index].sectionName!,
                      ),
                    ),
                  );
                },
              ),
            ],
          )
        : Container();
  }
}
