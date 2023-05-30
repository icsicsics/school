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
import 'package:schools/generated/l10n.dart';
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

  const HomeFatherContentWidget(
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
      widget.homeBloc.branchId = widget.parentHomeResponse.data![_current].branchId ?? "";
    }
  }

  @override
  void didUpdateWidget(covariant HomeFatherContentWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.homeBloc.branchId = widget.parentHomeResponse.data![_current].branchId ?? "";

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: CarouselSlider(
        items: (widget.parentHomeResponse.data)
            ?.map((item) => SingleChildScrollView(
          child: Column(
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
                                classroomSectionStudentsId:
                                item.classroomSectionStudentsId ??
                                    "",
                                classroomId: item.classroomId ?? "",
                              )));
                    },
                    child: Image.network(
                      item.getImage?.mediaUrl ?? "",
                      height: 200,
                      width: MediaQuery.of(context).size.width * 0.8,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          ImagesPath.logo,
                          width: 200,
                        );
                      },
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
                  Positioned(
                    right: 32,
                    bottom: -16,
                    child: InkWell(
                      onTap: () {
                        showAddPointFunction(
                            isParent: true,
                            context: context,
                            childName: widget
                                .teacherStudentProfileInSchoolHouseResponse
                                .data
                                ?.studentName ??
                                "",
                            token: widget.token,
                            classroomId: item.classroomId ?? "",
                            classroomSectionStudentsId:
                            item.classroomSectionStudentsId ?? "",
                            studentId: item.studentId ?? "",
                            onCreatePointSuccess: () {
                              BlocProvider.of<HomeBloc>(context).add(
                                  GetStudentProfileInSchoolHouseEvent(
                                      widget
                                          .parentHomeResponse
                                          .data![_current]
                                          .studentId ??
                                          ""));
                            });
                      },
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
                    ),
                  )
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          ImagesPath.startOrange,
                          width: 26,
                          height: 26,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          width: 35,
                          child: Text(
                            "${widget.teacherStudentProfileInSchoolHouseResponse.data?.allPointsCount ?? 0}",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
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
                          .data?.points?.reversed
                          .toList() ??
                          [])
                          .map((point) => Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                Colors.white,
                                radius: 17,
                                child: FaIcon(
                                  getIconFromCss(
                                    point.principleIcon ??
                                        "",
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
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text(
                                    getValueName(point),
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                      FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                      "${DateFormat("dd/MM/yyyy", "en").format(
                                        DateTime.parse(point
                                            .creationDate ??
                                            ""),
                                      )}"),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${S.of(context).By} ${point.createdByName ?? ""}",
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 16),
                        ],
                      ))
                          .toList(),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ))
            .toList(),
        carouselController: CarouselController(),
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          disableCenter: true,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
              BlocProvider.of<HomeBloc>(context).add(
                  GetStudentProfileInSchoolHouseEvent(
                      widget.parentHomeResponse.data![_current].studentId ??
                          ""));
              widget.homeBloc.branchId = widget.parentHomeResponse.data![_current].branchId ?? "";
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

  String getValueName(Points point) {
    if (point.valueName?.toLowerCase() == "others" ||
        point.valueName?.toLowerCase() == "اخرى" ||
        point.valueName?.toLowerCase() == "أخرى") {
      return point.description ?? "";
    }

    return point.valueName ?? "";
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
