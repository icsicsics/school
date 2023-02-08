import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  final Function() onTapMenu;
  final Function() onTapNotifications;
  final bool isFather;
  final HomeBloc bloc;
  final String language;
  final GetTeacherHomeResponse teacherHomeResponse;

  const HomeAppBarWidget(
      {super.key,
      required this.onTapMenu,
      required this.onTapNotifications,
      required this.isFather,
      required this.language,
      required this.bloc,
      required this.teacherHomeResponse});

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          ColorsManager.primaryColor,
          ColorsManager.secondaryColor,
        ],
        stops: [0.5, 0.8],
      )),
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 5),
        child: Row(
          children: [
            InkWell(
                onTap: widget.onTapMenu,
                child: SvgPicture.asset(ImagesPath.menu,
                    width: 25, height: 25, color: ColorsManager.whiteColor)),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Row(
                children: [
                  MediumTextWidget(
                      textAlign: TextAlign.center,
                      text: widget.isFather
                          ? widget.bloc.fatherInfoResponse.data != null
                              ? "${S.of(context).welcome} ${widget.bloc.fatherInfoResponse.data!.parentName}"
                              : S.of(context).welcome
                          : widget.teacherHomeResponse.data != null
                              ? widget.teacherHomeResponse.data!.schoolName
                              : "",
                      fontSize: 18,
                      color: ColorsManager.whiteColor),
                  const SizedBox(width: 10),
                  profileImageWidget(),
                  const Spacer()
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => _changeLanguage(),
                        child: _languageImage()),
                    InkWell(
                      onTap: widget.onTapNotifications,
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Visibility(
                                  visible: widget.isFather == false,
                                  child: const Icon(
                                    Icons.mail,
                                    color: ColorsManager.whiteColor,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Visibility(
                                    visible: widget.isFather,
                                    child: const Icon(
                                      Icons.mail,
                                      color: ColorsManager.whiteColor,
                                      size: 30,
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Visibility(
                                    visible: widget.isFather,
                                    child: const Icon(
                                      Icons.notifications,
                                      color: ColorsManager.yellow,
                                      size: 24,
                                    ),
                                  )),
                            ],
                          )),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _languageImage() => widget.language == "en"
      ? Image.asset(ImagesPath.ar, height: 35, width: 35)
      : Image.asset(
          ImagesPath.en,
          height: 35,
          width: 35,
        );

  void _changeLanguage() {
    if (widget.language == "en") {
      widget.bloc.add(ChangeLanguageEvent("ar"));
    } else {
      widget.bloc.add(ChangeLanguageEvent("en"));
    }
  }

  Widget profileImageWidget() {
    return widget.teacherHomeResponse.data != null
        ? ClipOval(
            child: Image.network(
              widget.teacherHomeResponse.data!.getLogo!.mediaUrl!,
              fit: BoxFit.fill,
              errorBuilder: (context, error, stackTrace) =>
                  _buildProfilePlaceHolder(),
            ),
          )
        : SizedBox(
            width: 30,
            height: 30,
            child: _buildProfilePlaceHolder(),
          );
  }

  SizedBox _buildProfilePlaceHolder() => SizedBox(
        height: 30,
        width: 30,
        child: CircleAvatar(
          child: SvgPicture.asset(ImagesPath.avatar,
              fit: BoxFit.cover, height: double.infinity),
        ),
      );
}
