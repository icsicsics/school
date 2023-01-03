import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  final Function() onTapMenu;
  final Function() onTapNotifications;
  final bool isFather;
  final HomeBloc bloc;
  final String language;

  const HomeAppBarWidget(
      {super.key,
      required this.onTapMenu,
      required this.onTapNotifications,
      required this.isFather,
      required this.language,
      required this.bloc});

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
        padding: const EdgeInsets.only(top: 50),
        child: Row(
          children: [
            IconButton(
                onPressed: widget.onTapMenu,
                icon: const Icon(
                  Icons.menu,
                  color: ColorsManager.whiteColor,
                  size: 30,
                )),
            Expanded(
              child: MediumTextWidget(
                  text: S.of(context).interactiveSchoolCounselling,
                  fontSize: 18,
                  color: ColorsManager.whiteColor),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [

                    InkWell(
                        onTap: () => _changeLanguage(),
                        child:_languageImage()),
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

  Widget _languageImage()=>
    widget.language=="en"? Image.asset(ImagesPath.ar,height: 35,width: 35):Image.asset(ImagesPath.en,height: 35,width: 35,);

  void _changeLanguage() {
    if (widget.language == "en") {
      widget.bloc.add(ChangeLanguageEvent("ar"));
    } else {
      widget.bloc.add(ChangeLanguageEvent("en"));
    }
  }
}
