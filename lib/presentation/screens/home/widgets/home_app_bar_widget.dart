import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/data/source/remote/model/weather/main.dart';
import 'package:schools/presentation/bloc/home/home_bloc.dart';
import 'package:schools/presentation/screens/notifications/notifications_screen.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';

class HomeAppBarWidget extends StatefulWidget {
  final Function() onTapMenu;
  final String schoolName;
  final String schoolImage;
  final String language;

  const HomeAppBarWidget({
    super.key,
    required this.onTapMenu,
    required this.schoolName,
    required this.schoolImage,
    required this.language,
  });

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  List<String> _roles = [];
  bool _isFather = false;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _roles = await SharedPreferencesManager.getRoles() ?? [];
    _isFather = await SharedPreferencesManager.getIsFather() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 120,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _isFather ? widget.onTapMenu() : Navigator.pop(context);
            },
            child: SvgPicture.asset(
              _isFather ? ImagesPath.menu : ImagesPath.arrowBackIcon,
              width: 25,
              height: 25,
              matchTextDirection: true,
              color: Color(0xff3bbbac),
            ),
          ),
          const SizedBox(width: 5),
          if (_roles.length > 1 && _isFather)
            IconButton(
              onPressed: () {
                BlocProvider.of<HomeBloc>(context).add(SwitchAccountEvent());
              },
              icon: const Icon(
                Icons.supervised_user_circle,
                color: ColorsManager.secondaryColor,
                size: 30,
              ),
            ),
          const Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSchoolLogo(),
              SizedBox(
                height: 8,
              ),
              MediumTextWidget(
                textAlign: TextAlign.center,
                text: widget.schoolName,
                fontSize: 14,
                color: Color(0xff3bbbac),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () => _changeLanguage(), child: _languageImage()),
                  SizedBox(
                    width: 6,
                  ),
                  Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => NotificationsScreen(
                                        isNotificationSelected: false,
                                      )));
                        },
                        child: Icon(
                          Icons.mail,
                          color: Color(0xff3bbbac),
                          size: 30,
                        ),
                      ),
                      Visibility(
                        visible: _isFather,
                        child: Positioned(
                          top: -5,
                          right: -5,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => NotificationsScreen(
                                            isNotificationSelected: true,
                                          )));
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
    );
  }

  Widget _buildSchoolLogo() {
    return widget.schoolImage.isNotEmpty
        ? ClipOval(
            child: Image.network(
              height: 65,
              width: 65,
              widget.schoolImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildProfilePlaceHolder(),
            ),
          )
        : _buildProfilePlaceHolder();
  }

  SizedBox _buildProfilePlaceHolder() {
    return SizedBox(
      height: 65,
      width: 65,
      child: CircleAvatar(
        child: SvgPicture.asset(ImagesPath.avatar,
            fit: BoxFit.cover, height: double.infinity),
      ),
    );
  }

  Widget _languageImage() {
    return widget.language == "en"
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
  }

  void _changeLanguage() {
    BlocProvider.of<HomeBloc>(context).add(
      ChangeLanguageEvent(
        widget.language,
      ),
    );
  }
}
