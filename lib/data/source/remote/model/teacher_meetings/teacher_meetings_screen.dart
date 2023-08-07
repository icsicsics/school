import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/teacher_meeting.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/custom_button_widget.dart';

class TeacherMeetingsScreen extends StatefulWidget {
  final List<TeacherMeeting> meetings;

  const TeacherMeetingsScreen({
    Key? key,
    required this.meetings,
  }) : super(key: key);

  @override
  State<TeacherMeetingsScreen> createState() => _TeacherMeetingsScreenState();
}

class _TeacherMeetingsScreenState extends State<TeacherMeetingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(widget.meetings.isNotEmpty ? widget.meetings.first.teacherName ?? "" : S.of(context).teacherMeetings),
      body: ListView.builder(
        itemCount: widget.meetings.length,
        itemBuilder: (context, index) {
          return _buildMeetingItem(widget.meetings[index]);
        },
      ),
    );
  }

  Widget _buildMeetingItem(TeacherMeeting meeting) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(237, 237, 237, 1),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.12),
            blurRadius: 24,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      ImagesPath.advisorPlaceHolder,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                meeting.studentName ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: ColorsManager.black,
                  letterSpacing: -0.14,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem(
                      teacherName: meeting.parentName ?? "",
                      imagePath: ImagesPath.teacher),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildItem(
                      teacherName: _formatDate(meeting.meetingTimeStr ?? ""),
                      imagePath: ImagesPath.calendarMeeting),
                ],
              ),
              const Expanded(child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem(
                    teacherName: meeting.parentPhone ?? "",
                    imagePath: ImagesPath.phone,
                    textDirection: TextDirection.ltr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonWidget(
                    onPressed: () {},
                    buttonText: meeting.status ?? "",
                    buttonTextColor: ColorsManager.whiteColor,
                    buttonHeight: 40,
                    buttonWidth: 95,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  String _formatDate(String date) {
    if (date.isEmpty) return "";
    DateTime dateTime = DateTime.parse(date);

    return intl.DateFormat("dd/MM/yyyy").format(dateTime);
  }

  Row _buildItem(
      {required String teacherName,
      required String imagePath,
      TextDirection? textDirection}) {
    return Row(
      children: [
        SvgPicture.asset(
          imagePath,
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          matchTextDirection: true,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          teacherName,
          style: TextStyle(
            fontSize: 13,
            color: ColorsManager.black,
            letterSpacing: -0.13,
            fontWeight: FontWeight.w500,
          ),
          textDirection: textDirection,
        )
      ],
    );
  }

  AppBar _buildAppBar(String teacherName) {
    return AppBar(
      title: Text(
        teacherName,
        style: const TextStyle(
          color: Color.fromRGBO(23, 23, 23, 1),
        ),
      ),
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          ImagesPath.arrowBackIcon,
          fit: BoxFit.scaleDown,
          width: 20,
          height: 20,
          matchTextDirection: true,
          color: Colors.black,
        ),
      ),
      foregroundColor: Colors.white,
    );
  }
}
