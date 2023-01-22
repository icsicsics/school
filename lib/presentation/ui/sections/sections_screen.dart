import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/sections/sections_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';
import 'package:schools/presentation/ui/sections/widgets/sections_content_widget.dart';
import 'package:schools/presentation/ui/student_houses/student_houses_screen.dart';

class SectionsScreen extends BaseStatefulWidget {
  const SectionsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _SectionsScreenState();
}

class _SectionsScreenState extends BaseState<SectionsScreen> {
  SectionsBloc get _bloc => BlocProvider.of<SectionsBloc>(context);

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<SectionsBloc, SectionsState>(
      listener: (context, state) {
        if (state is NavigateToNotificationScreenState) {
          _navigateToNotifications();
        } else if (state is NavigateToAddPointScreenState) {
          _navigateToAddPointScreen();
        } else if (state is NavigateToHomeScreenState) {
          _navigateToHomeScreen();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorsManager.whiteColor,
          body: SectionsContentWidget(bloc: _bloc),
          appBar: _appBar(),
        );
      },
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        elevation: 0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios,
              color: ColorsManager.secondaryColor, size: 25)),
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () => BlocProvider.of<SectionsBloc>(context)
                .add(NavigateToNotificationScreenEvent()),
            icon: const Icon(Icons.mail,
                color: ColorsManager.secondaryColor, size: 25)),
      ],
      title: BoldTextWidget(
          color: ColorsManager.secondaryColor,
          fontSize: 20,
          text: S.of(context).sections));

  void _navigateToNotifications() => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsScreen()),
      (route) => false);

  void _navigateToHomeScreen() => Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (_) => const HomeScreen()), (route) => false);

  void _navigateToAddPointScreen() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const StudentHousesScreen()));
}
