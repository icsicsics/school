import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/teacher_home/response/get_teacher_home_response.dart';
import 'package:schools/data/source/remote/model/weather/main.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

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
        color: ColorsManager.whiteColor,
      ),
      height: MediaQuery.of(context).size.height / 6,
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 5,right: 5),
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
            IconButton(
                onPressed: (){
                  widget.bloc.add(SwitchAccountEvent());
                },
                icon: const Icon(
                  Icons.supervised_user_circle,
                  color: ColorsManager.secondaryColor,
                  size: 30,
                )),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Visibility(
                  visible: widget.isFather == true ? false : true,
                  child: profileImageWidget(),
                ),
                SizedBox(
                  width: 210,
                  child: MediumTextWidget(
                    textAlign: TextAlign.center,
                    text: widget.isFather
                        ? widget.bloc.fatherInfoResponse.data != null
                        ? "${S.of(context).welcome} ${widget.bloc.fatherInfoResponse.data!.parentName}"
                        : S.of(context).welcome
                        : widget.teacherHomeResponse.data != null
                        ? widget.teacherHomeResponse.data!.schoolName
                        : "",
                    fontSize: 16,
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
                                    color: Color(0xff3bbbac),
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
                                      color: Color(0xff3bbbac),
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
      ? Image.asset(
          ImagesPath.ar,
          height: 35,
          width: 35,
    color: Color(0xff3bbbac),
  )
      : Image.asset(
          ImagesPath.en,
          height: 35,
          width: 35,
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
    return widget.teacherHomeResponse.data != null
        ? ClipOval(
            child: Image.network(
              height: 40,
              width: 40,
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
