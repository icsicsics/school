import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_children_list_widget.dart';
import 'package:schools/presentation/ui/home/widgets/father/father_heder_widget.dart';
import 'package:intl/intl.dart';
import 'package:schools/presentation/ui/school_houses/school_houses_screen.dart';

class HomeFatherContentWidget extends StatelessWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final HomeBloc homeBloc;
  final String token;
  final String language;
  final TeacherStudentProfileInSchoolHouseResponse teacherStudentProfileInSchoolHouseResponse;

  const HomeFatherContentWidget({Key? key,
    required this.parentHomeResponse,
    required this.homeBloc,
    required this.token,
    required this.teacherStudentProfileInSchoolHouseResponse,
    required this.language})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
          itemCount: (parentHomeResponse.data?.length ?? 0) == 0 ? 0 : 1,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SchoolHousesScreen(
                          token: token,
                          classRoomId:
                          parentHomeResponse.data![0].branchId ?? "",
                          language: language,
                          isComingFromHome: false,
                        )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        parentHomeResponse.data![0].getImage?.mediaUrl ?? "",
                        width: 400,
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            ImagesPath.logo,
                            width: 400,
                            height: 200,
                          );
                        },
                      ),
                      Positioned(
                        left: 16,
                        bottom: -16,
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 0.3,
                                    spreadRadius: 0,
                                    color: Color(0x2b040405))
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border:
                              Border.all(width: 1, color: Color(0xe2e2e2))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          child: Text(
                            parentHomeResponse.data![0].studentName ?? "",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 32,
                        bottom: -16,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 17,
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF35a6bc),
                            radius: 14,
                            child: SvgPicture.asset(
                              ImagesPath.star,
                              width: 22,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 32),
                  Column(
                    children: (teacherStudentProfileInSchoolHouseResponse.data?.points ?? []).map((point) => Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 17,
                              child: SvgPicture.asset(
                                ImagesPath.star,
                                width: 22,
                                height: 22,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${point.valueName ?? ""}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("${DateFormat("dd/MM/yyyy", "en").format(
                                  DateTime.parse(point.creationDate ?? ""),) }"),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 16),

                      ],
                    )).toList(),
                  )
                ],
              ),
            );
          }),
    );
    /*return Column(
      children: [
        homeBloc.fatherInfoResponse.data != null
            ? FatherHeaderWidget(homeBloc: homeBloc)
            : Container(height: 350),
        parentHomeResponse.data != null
            ? FatherChildrenListWidget(
                classroomId: "79a93948-fb97-4de3-9166-08dafa1996ad",
                classroomSectionStudentsId:
                    "f2894667-39a5-42b6-c7df-08dafd8025b3",
                parentHomeResponse: parentHomeResponse,
                token: token,
                language: language, onCreatePointSuccess: () {  },)
            : Container(),
      ],
    );*/
  }


  getPoints(List<Points>? points) {
    for (var point in points ?? []) {
      return Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 17,
                child: SvgPicture.asset(
                  ImagesPath.star,
                  width: 22,
                  height: 22,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${point.valueName ?? ""}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("${DateFormat("dd/MM/yyyy", "en").format(
                    DateTime.parse(point.creationDate ?? ""),) }"),
                  SizedBox(
                    height: 8,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 16),

        ],
      );
    }
  }
}
