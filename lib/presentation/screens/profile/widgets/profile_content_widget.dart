import 'package:flutter/material.dart';
import 'package:schools/core/utils/awesome/font_awesome_flutter.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/screens/profile/widgets/father_of_widget.dart';
import 'package:schools/presentation/screens/profile/widgets/profile_header_widget.dart';
import 'package:schools/presentation/screens/profile/widgets/profile_info_content_widget.dart';
import 'package:schools/presentation/screens/profile/widgets/teacher_of_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileContentWidget extends StatefulWidget {
  final bool isFather;
  final String profileImage;
  final ProfileBloc bloc;
  final TeacherInfoResponse teacherInfoResponse;
  final FatherInfoResponse fatherInfoResponse;
  final String language;
  final String classroomId;
  final String classroomSectionStudentsId;

  const ProfileContentWidget(
      {Key? key,
      required this.isFather,
      required this.profileImage,
      required this.bloc,
      required this.teacherInfoResponse,
      required this.fatherInfoResponse,
      required this.language,
      required this.classroomSectionStudentsId,
      required this.classroomId})
      : super(key: key);

  @override
  State<ProfileContentWidget> createState() => _ProfileContentWidgetState();
}

class _ProfileContentWidgetState extends State<ProfileContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileHeaderWidget(
              bloc: widget.bloc,
              profileImage: widget.profileImage,
              isFather: widget.isFather,
              fatherInfoResponse: widget.fatherInfoResponse,
              teacherInfoResponse: widget.teacherInfoResponse),
          ProfileInfoContentWidget(
              isFather: widget.isFather,
              fatherInfoResponse: widget.fatherInfoResponse,
              teacherInfoResponse: widget.teacherInfoResponse),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _item(
                onTap: () {
                  _launchUrl(widget.teacherInfoResponse.data?.facebookURL ??
                      "https://www.facebook.com/");
                },
                icon: FontAwesomeIcons.facebook,
                showItem:
                    widget.teacherInfoResponse.data?.facebookURL != null ||
                        (widget.teacherInfoResponse.data?.facebookURL ?? "")
                            .isNotEmpty,
              ),
              _item(
                onTap: () {
                  _launchUrl(widget.teacherInfoResponse.data!.instagramURL ??
                      "https://www.instagram.com/");
                },
                icon: FontAwesomeIcons.instagram,
                showItem:
                    widget.teacherInfoResponse.data?.instagramURL != null ||
                        (widget.teacherInfoResponse.data?.instagramURL ?? "")
                            .isNotEmpty,
              ),
              _item(
                onTap: () {
                  _launchUrl(widget.teacherInfoResponse.data?.tweeterURL ??
                      "https://twitter.com/");
                },
                icon: FontAwesomeIcons.twitter,
                showItem: widget.teacherInfoResponse.data?.tweeterURL != null ||
                    (widget.teacherInfoResponse.data?.tweeterURL ?? "")
                        .isNotEmpty,
              ),
              _item(
                onTap: () {
                  _launchUrl(widget.teacherInfoResponse.data?.snapchatURL ??
                      "https://www.snapchat.com/");
                },
                icon: FontAwesomeIcons.snapchat,
                showItem:
                    widget.teacherInfoResponse.data?.snapchatURL != null ||
                        (widget.teacherInfoResponse.data?.snapchatURL ?? "")
                            .isNotEmpty,
              ),
              _item(
                onTap: () {
                  _launchUrl(widget.teacherInfoResponse.data?.websiteURL ?? "");
                },
                icon: FontAwesomeIcons.globe,
                showItem: widget.teacherInfoResponse.data?.websiteURL != null ||
                    (widget.teacherInfoResponse.data?.websiteURL ?? "")
                        .isNotEmpty,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          widget.isFather
              ? FatherOfWidget(
                  fatherInfoResponse: widget.fatherInfoResponse,
                  language: widget.language,
                  classroomId: widget.classroomId,
                  classroomSectionStudentsId: widget.classroomSectionStudentsId,
                )
              : TeacherOfWidget(
                  teacherInfoResponse: widget.teacherInfoResponse,
                  language: widget.language,
                  classroomId: widget.classroomId,
                  classroomSectionStudentsId: widget.classroomSectionStudentsId,
                )
        ],
      ),
    );
  }

  Widget _item({
    required IconData icon,
    required Function() onTap,
    required bool showItem,
  }) {
    return showItem
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                size: 24,
                color: ColorsManager.primaryColor,
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void launchWhatsapp(String whatsappNumber) async {
    await canLaunchUrl(Uri.parse(whatsappNumber))
        ? launchUrl(Uri.parse(whatsappNumber))
        : launch("https://wa.me/$whatsappNumber");
  }
}
