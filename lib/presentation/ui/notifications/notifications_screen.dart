import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/ui/notifications/widgets/notifications_content_widget.dart';
import 'package:schools/presentation/ui/side_menu_widget/side_menu_screen.dart';

class NotificationsScreen extends BaseStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseState<NotificationsScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
      drawer: const SideMenuScreen(),
        key: _key,
        body: BlocConsumer<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return NotificationsContentWidget(
              globalKey: _key,
            );
          },
        ));
  }
}
