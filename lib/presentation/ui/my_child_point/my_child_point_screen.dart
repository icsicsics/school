import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/my_child_points/my_child_points_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';
import 'package:schools/presentation/ui/my_child_point/widget/my_child_content_widget.dart';
import 'package:schools/presentation/ui/my_children/my_children_screen.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class MyChildPointsScreen extends BaseStatefulWidget {
  final String language;
  const MyChildPointsScreen({super.key,required this.language});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _MyChildPointsScreenState();
}

class _MyChildPointsScreenState extends BaseState<MyChildPointsScreen> {
  MyChildPointsBloc get _bloc => BlocProvider.of<MyChildPointsBloc>(context);
  bool _isFather = false;

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return  BlocConsumer<MyChildPointsBloc, MyChildPointsState>(
  listener: (context, state) {
      if (state is OpenPointScreenState) {
        _openPointScreen("");
      } else if (state is NavigateToHomeScreenState) {
        _navigateHomeScreen();
      } else if (state is NavigateToNotificationScreenState) {
        _navigateToNotificationScreen();
      }    else if (state is GetIsFatherState) {
        _isFather = state.isFather;
      }
  },
  builder: (context, state) {
    return Scaffold(
          backgroundColor: ColorsManager.whiteColor,
          appBar: _appBar(),
          body: MyChildContentWidget(
            bloc: _bloc,
          ));
  },
);
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
        leading: IconButton(
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
        title: BoldTextWidget(
            color: ColorsManager.secondaryColor,
            fontSize: 20,
            text: _isFather == false ? S.of(context).studentsProfile: S.of(context).myChildren));

  void _openPointScreen(studentId) => Navigator.push(
      context, MaterialPageRoute(builder: (_) =>  MyChildrenScreen(studentId: studentId, language: widget.language)));

  void _navigateHomeScreen() => Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);

  void _navigateToNotificationScreen() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);
}
