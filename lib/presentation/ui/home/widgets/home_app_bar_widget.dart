import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  final Function() onTapMenu;
  final Function() onTapNotifications;
  final HomeBloc bloc;
  final String language;

  const HomeAppBarWidget(
      {Key? key,
      required this.onTapMenu,
      required this.onTapNotifications,
      required this.bloc,
      required this.language})
      : super(key: key);

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
            const Expanded(
              child: MediumTextWidget(
                  text: "Interactive School Counselling",
                  fontSize: 18,
                  color: ColorsManager.whiteColor),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () => _changeLanguage(),
                        child: MediumTextWidget(
                            text: widget.language == "en"
                                ? S.of(context).arabic
                                : S.of(context).english,
                            fontSize: 14,
                            color: ColorsManager.whiteColor)),
                    IconButton(
                      onPressed: widget.onTapNotifications,
                      icon: const Icon(
                        Icons.mail_lock,
                        color: ColorsManager.whiteColor,
                        size: 25,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void _changeLanguage() {
    if (widget.language == "en") {
      widget.bloc.add(ChangeLanguageEvent("ar"));
    } else {
      widget.bloc.add(ChangeLanguageEvent("en"));
    }
  }
}
