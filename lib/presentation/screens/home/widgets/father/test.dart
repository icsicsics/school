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
import 'package:schools/data/source/remote/model/weather/main.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/widgets/dialogs/show_add_point_function.dart';
import 'package:schools/presentation/screens/home/widgets/father/father_children_list_widget.dart';
import 'package:schools/presentation/screens/home/widgets/father/father_heder_widget.dart';
import 'package:intl/intl.dart';
import 'package:schools/presentation/screens/my_children/my_children_screen.dart';
import 'package:schools/presentation/screens/school_houses/school_houses_screen.dart';

class Test extends StatefulWidget {
  final GetChildrenByParentResponse parentHomeResponse;
  final HomeBloc homeBloc;
  final String token;
  final String language;
  final TeacherStudentProfileInSchoolHouseResponse
      teacherStudentProfileInSchoolHouseResponse;

  const Test({
    Key? key,
    required this.parentHomeResponse,
    required this.homeBloc,
    required this.token,
    required this.teacherStudentProfileInSchoolHouseResponse,
    required this.language,
  }) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
    if (widget.parentHomeResponse.data!.isNotEmpty) {
      BlocProvider.of<HomeBloc>(context).add(
          GetStudentProfileInSchoolHouseEvent(
              widget.parentHomeResponse.data![0].studentId ?? ""));
      widget.homeBloc.branchId =
          widget.parentHomeResponse.data![_current].branchId ?? "";
    }


  }

  @override
  void didUpdateWidget(covariant Test oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.homeBloc.branchId =
        widget.parentHomeResponse.data![_current].branchId ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.parentHomeResponse.data!.length,
        itemBuilder: (context, int itemIndex, int pageViewIndex) {
          return Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    _buildImageSection(),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => SchoolHousesScreen(
                                      token: widget.token,
                                      classRoomId: widget.parentHomeResponse
                                              .data![_current].branchId ??
                                          "",
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
                          const SizedBox(height: 16),
                          Column(
                            children:
                                (widget.teacherStudentProfileInSchoolHouseResponse
                                            .data?.points?.reversed
                                            .toList() ??
                                        [])
                                    .map((point) => Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                                const SizedBox(width: 12),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                      DateTime.parse(
                                                          point.creationDate ??
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
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
              widget.homeBloc.branchId =
                  widget.parentHomeResponse.data![_current].branchId ?? "";
            });
          },
        ));
  }

  Stack _buildImageSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => MyChildrenScreen(
                          studentId: widget.parentHomeResponse.data![_current]
                                  .studentId ??
                              "",
                          language: widget.language,
                          isParent: true,
                          classroomSectionStudentsId: widget.parentHomeResponse
                                  .data![_current].classroomSectionStudentsId ??
                              "",
                          classroomId: widget.parentHomeResponse.data![_current]
                                  .classroomId ??
                              "",
                        )));
          },
          child: Image.network(
            widget.parentHomeResponse.data![_current].getImage?.mediaUrl ?? "",
            height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                ImagesPath.logo,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
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
                width: 1,
                color: ColorsManager.grayColor.withOpacity(0.4),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Text(
              widget.parentHomeResponse.data![_current].studentName ?? "",
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
                  childName: widget.teacherStudentProfileInSchoolHouseResponse
                          .data?.studentName ??
                      "",
                  token: widget.token,
                  classroomId:
                      widget.parentHomeResponse.data![_current].classroomId ??
                          "",
                  classroomSectionStudentsId: widget.parentHomeResponse
                          .data![_current].classroomSectionStudentsId ??
                      "",
                  studentId:
                      widget.parentHomeResponse.data![_current].studentId ?? "",
                  onCreatePointSuccess: () {
                    BlocProvider.of<HomeBloc>(context).add(
                        GetStudentProfileInSchoolHouseEvent(widget
                                .parentHomeResponse.data![_current].studentId ??
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
    );
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
