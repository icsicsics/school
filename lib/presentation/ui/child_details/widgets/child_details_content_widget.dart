import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/child_details/widgets/child_details_app_bar_widget.dart';
import 'package:schools/presentation/ui/child_details/widgets/child_details_information_widget.dart';
import 'package:schools/presentation/ui/child_details/widgets/child_details_title_widget.dart';
import 'package:schools/presentation/ui/notifications/notifications_screen.dart';

class ChildDetailsContentWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;

  const ChildDetailsContentWidget({Key? key, required this.globalKey})
      : super(key: key);

  @override
  State<ChildDetailsContentWidget> createState() =>
      _ChildDetailsContentWidgetState();
}

class _ChildDetailsContentWidgetState extends State<ChildDetailsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChildDetailsAppBarWidget(
          onTapMenu: () => widget.globalKey.currentState!.openDrawer(),
          onTapNotifications: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const NotificationsScreen()));
          },
        ),
        const SizedBox(height: 2),
        const ChildDetailsTitleWidget(),
        const ChildDetailsInformationWidget()
      ],
    );
  }
}
