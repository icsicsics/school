import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/presentation/bloc/localization/language.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  final Function() onTapMenu;
  final Function() onTapNotifications;

  const HomeAppBarWidget(
      {Key? key, required this.onTapMenu, required this.onTapNotifications})
      : super(key: key);

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    Languages languageChangeProvider =
        Provider.of<Languages>(context, listen: true);

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
                    IconButton(
                        onPressed: () async{
                           await SharedPreferencesManager.setAppLanguage("ar");
                            languageChangeProvider.changeLanguage('ar');
                        },
                        icon: const Icon(
                          Icons.language,
                          color: ColorsManager.whiteColor,
                        )),
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

}
