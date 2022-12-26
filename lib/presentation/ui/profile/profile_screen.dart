import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_content_widget.dart';

class ProfileScreen extends BaseStatefulWidget {
  const ProfileScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseState<ProfileScreen> {
  ProfileBloc get _bloc => BlocProvider.of<ProfileBloc>(context);
  bool _isFather = false;

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is GetIsFatherState) {
          _isFather = state.isFather;
        } else if (state is NavigateToNotificationScreenState) {
          _navigateToNotificationScreen();
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.backgroundColor,
            appBar: _appBar(),
            body: ProfileContentWidget(
              isFather: _isFather,
            ));
      },
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
        leading:  IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: ColorsManager.secondaryColor, size: 25),
        ),
        centerTitle: false,
        actions: [
          InkWell(
            onTap: ()=>_bloc.add(NavigateToNotificationScreenEvent()),
            child: SizedBox(
                width: 50,
                height: 50,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(
                        visible: _isFather == false,
                        child: const Icon(
                          Icons.mail,
                          color: ColorsManager.secondaryColor,
                          size: 25,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Visibility(
                          visible: _isFather,
                          child: const Icon(
                            Icons.mail,
                            color: ColorsManager.secondaryColor,
                            size: 25,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Visibility(
                          visible:_isFather,
                          child: const Icon(
                            Icons.notifications,
                            color: ColorsManager.yellow,
                            size: 24,
                          ),
                        )),
                  ],
                )),
          ),
        ],
        title:  BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: S.of(context).myProfile),
      );

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);
}
