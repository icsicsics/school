import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/side_menu_header.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/side_menu_item.dart';
import 'package:schools/presentation/screens/side_menu_widget/widgets/social_madia_widget.dart';

class SideMenuContentWidget extends StatefulWidget {
  final SideMenuBloc bloc;
  final String language;
  final bool isFather;

  const SideMenuContentWidget(
      {Key? key,
      required this.language,
      required this.bloc,
      required this.isFather})
      : super(key: key);

  @override
  State<SideMenuContentWidget> createState() => _SideMenuContentWidgetState();
}

class _SideMenuContentWidgetState extends State<SideMenuContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          Column(
            children: [
              SideMenuHeader(
                  bloc: widget.bloc,
                  language: widget.language,
                  isFather: widget.isFather),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          ColorsManager.primaryColor,
                          ColorsManager.secondaryColor,
                        ],
                        stops: [0.5, 0.8],
                      ),
                      borderRadius: widget.language == "en"
                          ? const BorderRadius.only(
                              bottomRight: Radius.circular(100))
                          : const BorderRadius.only(
                              bottomRight: Radius.circular(0))),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.isFather ? SizedBox.shrink() : SideMenuItem(
                            icon: Icons.home_filled,
                            title: S.of(context).schoolHomes,
                            onTap: () =>
                                BlocProvider.of<SideMenuBloc>(context).add(
                              SideMenuHomeEvent(),
                            ),
                          ),
                          widget.isFather ? SizedBox.shrink() : SideMenuItem(
                            icon: Icons.home_filled,
                            title: S.of(context).advisors,
                            onTap: () =>
                                BlocProvider.of<SideMenuBloc>(context).add(
                                  NavigateToAdvisorsScreenEvent(),
                                ),
                          ),
                          widget.isFather ? SizedBox.shrink() : SideMenuItem(
                            icon: Icons.home_filled,
                            title: S.of(context).teacherMeetings,
                            onTap: () =>
                                BlocProvider.of<SideMenuBloc>(context).add(
                                  NavigateToTeacherMeetingsEvent(),
                                ),
                          ),
                          SideMenuItem(
                            icon: Icons.person,
                            title: S.of(context).myProfile,
                            onTap: () =>
                                BlocProvider.of<SideMenuBloc>(context).add(
                              SideMenuUserProfileEvent(),
                            ),
                          ),
                          SideMenuItem(
                              icon: Icons.mail,
                              title: S.of(context).contactUs,
                              onTap: () =>
                                  BlocProvider.of<SideMenuBloc>(context).add(
                                      OpenWebViewEvent(
                                          webViewContent: "",
                                          screenTitle: S.of(context).contactUs,
                                          isUrlContent: false))),
                          SideMenuItem(
                            icon: Icons.info_outline,
                            title: S.of(context).aboutApp,
                            onTap: () => BlocProvider.of<SideMenuBloc>(context)
                                .add(NavigateToAboutScreenEvent()),
                          ),
                          SideMenuItem(
                            icon: Icons.info_outline,
                            title: S.of(context).termsAndConditions,
                            onTap: () =>
                                BlocProvider.of<SideMenuBloc>(context).add(
                              OpenWebViewEvent(
                                  webViewContent: "",
                                  screenTitle: S.of(context).termsAndConditions,
                                  isUrlContent: false),
                            ),
                          ),
                          SideMenuItem(
                            icon: Icons.logout_sharp,
                            title: S.of(context).logout,
                            onTap: () =>
                                BlocProvider.of<SideMenuBloc>(context).add(
                              LogoutEvent(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: SocialMediaWidget(),
            ),
          )
        ]));
  }
}
