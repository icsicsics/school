import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/home/widgets/father/home_father_content_widget.dart';
import 'package:schools/presentation/ui/home/widgets/home_app_bar_widget.dart';
import 'package:schools/presentation/ui/home/widgets/teacher/home_teacher_details_widget.dart';
import 'package:schools/presentation/ui/home/widgets/title_widget.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class HomeContentWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;
  final bool isFather;

  const HomeContentWidget(
      {Key? key, required this.globalKey, required this.isFather})
      : super(key: key);

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(

          onTapMenu: () => widget.globalKey.currentState!.openDrawer(),
          onTapNotifications: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsScreen()),
                (route) => false);
          },
        ),
        const SizedBox(height: 2),
        const HomeTitleWidget(),
        _buildScreen()
      ],
    );
  }

  Widget _buildScreen() {
    if (widget.isFather == true) {
      return const HomeFatherContentWidget();
    }
    return const HomeTeacherDetailsWidget();
  }
}
