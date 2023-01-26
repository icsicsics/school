import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/presentation/shere_widgets/card_widget.dart';
import 'package:schools/presentation/ui/school_houses/school_houses_screen.dart';

class HomeTeacherDetailsWidget extends StatefulWidget {
  final String token;
  final GetTeacherHomeResponse teacherHomeResponse;
  final String language;

  const HomeTeacherDetailsWidget(
      {Key? key,
      required this.teacherHomeResponse,
      required this.token,
      required this.language})
      : super(key: key);

  @override
  State<HomeTeacherDetailsWidget> createState() =>
      _HomeTeacherDetailsWidgetState();
}

class _HomeTeacherDetailsWidgetState extends State<HomeTeacherDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.teacherHomeResponse.data != null
        ? GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, mainAxisExtent: 200),
            itemCount: widget.teacherHomeResponse.data!.length,
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
                                  classRoomId: widget.teacherHomeResponse
                                      .data![index].classroomToSectionId!,
                                  language: widget.language,
                                )));
                  },
                  child: CardWidget(
                    section:
                        widget.teacherHomeResponse.data![index].classroomName!,
                    imagePath: widget.teacherHomeResponse.data![index].getLogo!.mediaUrl.toString(),
                    grade: widget.teacherHomeResponse.data![index].sectionName!,
                  ),
                ),
              );
            },
          )
        : Container();
  }
}
