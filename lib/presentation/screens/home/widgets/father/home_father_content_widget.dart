import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schools/core/utils/awesome/name_icon_mapping.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/children_by_parent/response/get_children_by_parent_response.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/points.dart';
import 'package:schools/data/source/remote/model/teacher_student_profile_in_school_house/teacher_student_profile_in_school_house_response.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/screens/home/widgets/father/father_children_list_widget.dart';
import 'package:schools/presentation/screens/home/widgets/father/father_heder_widget.dart';
import 'package:intl/intl.dart';
import 'package:schools/presentation/screens/my_children/my_children_screen.dart';
import 'package:schools/presentation/screens/school_houses/school_houses_screen.dart';

class HomeFatherContentWidget extends StatefulWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final HomeBloc homeBloc;
  final String token;
  final String language;
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;

  HomeFatherContentWidget(
      {Key? key,
      required this.parentHomeResponse,
      required this.homeBloc,
      required this.token,
      required this.teacherStudentProfileInSchoolHouseResponse,
      required this.language})
      : super(key: key);

  @override
  State<HomeFatherContentWidget> createState() =>
      _HomeFatherContentWidgetState();
}

class _HomeFatherContentWidgetState extends State<HomeFatherContentWidget> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
    if (widget.parentHomeResponse.data!.isNotEmpty) {
      BlocProvider.of<HomeBloc>(context).add(
          GetStudentProfileInSchoolHouseEvent(
              widget.parentHomeResponse.data![0].studentId ?? ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: CarouselSlider(
        items: (widget.parentHomeResponse.data)
            ?.map((item) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.bottomCenter,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MyChildrenScreen(
                                          studentId: item.studentId ?? "",
                                          language: widget.language,
                                          isParent: true,
                                          classroomSectionStudentsId: "",
                                          classroomId:
                                              "97cd1b95-0e1d-4b37-e814-08db18c1786b",
                                        )));
                          },
                          child: Row(
                            children: [
                              if (_current != 0)
                                Icon(
                                  Icons.keyboard_arrow_left,
                                  size: 24,
                                ),
                              Expanded(child: SizedBox()),
                              Image.network(
                                item.getImage?.mediaUrl ?? "",
                                height: 200,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    ImagesPath.logo,
                                    width: 200,
                                  );
                                },
                              ),
                              Expanded(child: SizedBox()),
                              if (_current !=
                                  widget.parentHomeResponse.data!.length - 1)
                                Icon(
                                  Icons.keyboard_arrow_right,
                                  size: 24,
                                ),
                            ],
                          ),
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
                                border: Border.all(
                                    width: 1, color: Color(0xe2e2e2))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                            child: Text(
                              item.studentName ?? "",
                            ),
                          ),
                        ),
                        // Positioned(
                        //   right: 32,
                        //   bottom: -16,
                        //   child: InkWell(
                        //     onTap: () {
                        //       showAddPointFunction(
                        //           isParent: true,
                        //           context: context,
                        //           childName: widget
                        //                   .teacherStudentProfileInSchoolHouseResponse
                        //                   .data
                        //                   ?.studentName ??
                        //               "",
                        //           token: widget.token,
                        //           classroomId: "",
                        //           classroomSectionStudentsId: "",
                        //           studentId: widget
                        //                   .teacherStudentProfileInSchoolHouseResponse
                        //                   .data
                        //                   ?.studentId ??
                        //               "",
                        //           onCreatePointSuccess: () {});
                        //     },
                        //     child: CircleAvatar(
                        //       backgroundColor: Colors.white,
                        //       radius: 17,
                        //       child: CircleAvatar(
                        //         backgroundColor: Color(0xFF35a6bc),
                        //         radius: 14,
                        //         child: SvgPicture.asset(
                        //           ImagesPath.star,
                        //           width: 22,
                        //           height: 22,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    SizedBox(height: 32),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SchoolHousesScreen(
                                      token: widget.token,
                                      classRoomId: item.branchId ?? "",
                                      language: widget.language,
                                      isComingFromHome: true,
                                    )));
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagesPath.startOrange,
                                width: 22,
                                height: 22,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                "${widget.teacherStudentProfileInSchoolHouseResponse.data?.allPointsCount ?? 0}",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: 340,
                                child: Text(
                                  "${widget.teacherStudentProfileInSchoolHouseResponse.data?.schoolName ?? ""} - ${widget.teacherStudentProfileInSchoolHouseResponse.data?.sectionName ?? ""} ${widget.teacherStudentProfileInSchoolHouseResponse.data?.classroomName ?? ""}",
                                  maxLines: 3,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Column(
                            children:
                                (widget.teacherStudentProfileInSchoolHouseResponse
                                            .data?.points ??
                                        [])
                                    .map((point) => Column(
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 17,
                                                  child: FaIcon(
                                                    getIconFromCss(
                                                      point.principleIcon ?? "",
                                                    ),
                                                    color: ColorsManager
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 12,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${point.valueName ?? ""}",
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                        "${DateFormat("dd/MM/yyyy", "en").format(
                                                      DateTime.parse(
                                                          point.creationDate ??
                                                              ""),
                                                    )}"),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 16),
                                          ],
                                        ))
                                    .toList(),
                          )
                        ],
                      ),
                    )
                  ],
                ))
            .toList(),
        carouselController: CarouselController(),
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: false,
          enlargeCenterPage: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enableInfiniteScroll: false,
          disableCenter: true,
          aspectRatio: 2.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
              BlocProvider.of<HomeBloc>(context).add(
                  GetStudentProfileInSchoolHouseEvent(
                      widget.parentHomeResponse.data![_current].studentId ??
                          ""));
            });
          },
        ),
      ),
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
                    DateTime.parse(point.creationDate ?? ""),
                  )}"),
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
