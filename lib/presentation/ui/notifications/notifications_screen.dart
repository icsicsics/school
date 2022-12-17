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
  NotificationsBloc get _bloc => BlocProvider.of<NotificationsBloc>(context);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _isFather = false;

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return Scaffold(
        drawer: const SideMenuScreen(
          isComFromHome: false,
        ),
        key: _key,
        body: BlocConsumer<NotificationsBloc, NotificationsState>(
          listener: (context, state) {
            if (state is GetIsFatherState) {
              _isFather = state.isFather;
            }
          },
          builder: (context, state) {
            return NotificationsContentWidget(
              globalKey: _key,
              isFather: _isFather,
            );
          },
        ));
  }
}
