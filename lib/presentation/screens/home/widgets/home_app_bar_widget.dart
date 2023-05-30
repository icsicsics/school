import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/weather/main.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  final Function() onTapMenu;
  final Function(bool) onTapNotifications;
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
  List<String> roles = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    roles = await SharedPreferencesManager.getRoles() ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.whiteColor,
      ),
      height: widget.isFather
          ? MediaQuery.of(context).size.height / 4.5
          : MediaQuery.of(context).size.height / 4.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: widget.onTapMenu,
              child: SvgPicture.asset(
                ImagesPath.menu,
                width: 25,
                height: 25,
                matchTextDirection: true,
                color: Color(0xff3bbbac),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (roles.length > 1)
              IconButton(
                  onPressed: () {
                    widget.bloc.add(SwitchAccountEvent());
                  },
                  icon: const Icon(
                    Icons.supervised_user_circle,
                    color: ColorsManager.secondaryColor,
                    size: 30,
                  )),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: widget.isFather
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                profileImageWidget(),
                SizedBox(
                  width: 210,
                  child: MediumTextWidget(
                    textAlign: TextAlign.center,
                    text: widget.isFather
                        ? widget.bloc.fatherInfoResponse.data != null
                            ? widget.bloc.childName
                            : ""
                        : widget.teacherHomeResponse.data != null
                            ? widget.teacherHomeResponse.data!.schoolName
                            : "",
                    fontSize: 14,
                    color: Color(0xff3bbbac),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => _changeLanguage(),
                        child: _languageImage()),
                    SizedBox(
                      width: 6,
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            widget.onTapNotifications(false);
                          },
                          child: Icon(
                            Icons.mail,
                            color: Color(0xff3bbbac),
                            size: 30,
                          ),
                        ),
                        Visibility(
                          visible: widget.isFather,
                          child: Positioned(
                            top: -5,
                            right: -5,
                            child: InkWell(
                              onTap: () {
                                widget.onTapNotifications(true);
                              },
                              child: const Icon(
                                Icons.notifications,
                                color: ColorsManager.yellow,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _languageImage() => widget.language == "en"
      ? Image.asset(
          ImagesPath.ar,
          height: 30,
          width: 30,
          color: Color(0xff3bbbac),
        )
      : Image.asset(
          ImagesPath.en,
          height: 30,
          width: 30,
          color: Color(0xff3bbbac),
        );

  void _changeLanguage() {
    if (widget.language == "en") {
      widget.bloc.add(ChangeLanguageEvent("ar"));
    } else {
      widget.bloc.add(ChangeLanguageEvent("en"));
    }
  }

  Widget profileImageWidget() {
    return widget.isFather == false
        ? widget.teacherHomeResponse.data != null
            ? ClipOval(
                child: Image.network(
                  height: 60,
                  width: 60,
                  widget.teacherHomeResponse.data!.getLogo!.mediaUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildProfilePlaceHolder(),
                ),
              )
            : SizedBox(
                width: 30,
                height: 30,
                child: _buildProfilePlaceHolder(),
              )
        : widget.bloc.fatherInfoResponse.data != null
            ? ClipOval(
                child: Image.network(
                  height: 60,
                  width: 60,
                  widget.bloc.schoolLogo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildProfilePlaceHolder(),
                ),
              )
            : SizedBox(
                width: 30, height: 30, child: _buildProfilePlaceHolder());
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
