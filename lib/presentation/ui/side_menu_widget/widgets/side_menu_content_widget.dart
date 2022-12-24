import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/side_menu/side_menu_bloc.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_header.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_item.dart';
import 'package:schools/presentation/ui/side_menu_widget/widgets/side_menu_sochila_madia_widget.dart';

class SideMenuContentWidget extends StatefulWidget {
  final SideMenuBloc bloc;
  const SideMenuContentWidget({Key? key,required this.bloc}) : super(key: key);

  @override
  State<SideMenuContentWidget> createState() => _SideMenuContentWidgetState();
}

class _SideMenuContentWidgetState extends State<SideMenuContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
             SideMenuHeader(bloc: widget.bloc),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorsManager.primaryColor,
                      ColorsManager.secondaryColor,
                    ],
                    stops: [0.5, 0.8],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SideMenuItem(
                        icon: Icons.home_filled,
                        title: "School Homes",
                        onTap: () => BlocProvider.of<SideMenuBloc>(context)
                            .add(SideMenuHomeEvent())),
                    SideMenuItem(
                        icon: Icons.person,
                        title: "User Profile",
                        onTap: () => BlocProvider.of<SideMenuBloc>(context)
                            .add(SideMenuUserProfileEvent())),
                    SideMenuItem(
                        icon: Icons.mail,
                        title: "Contact Us",
                        onTap: () => BlocProvider.of<SideMenuBloc>(context)
                            .add(SideMenuContactUsEvent())),
                    SideMenuItem(
                        icon: Icons.info_outline,
                        title: "About App",
                        onTap: () => BlocProvider.of<SideMenuBloc>(context)
                            .add(SideMenuAboutAppEvent())),
                    const SideMenuSocialMediaWidget(),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
