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
  String _language = '';
  String _token= '';

  @override
  void initState() {
    _bloc.add(GetIsFatherEvent());
    _bloc.add(GetLanguageEvent());
    super.initState();
  }

  @override
  Widget baseBuild(BuildContext context) {
    return BlocConsumer<NotificationsBloc, NotificationsState>(
      listener: (context, state) {
        if (state is GetIsFatherState) {
          _isFather = state.isFather;
        } else if (state is GetLanguageSuccessState) {
          _language = state.language;
          _bloc.add(GetTokenEvent());
        }else if (state is GetTokenSuccessState){
          _token=state.token;
        }
      },
      builder: (context, state) {
        return Scaffold(
            drawer: SideMenuScreen(
              isComFromHome: false,
              language: _language,
              token: _token,
            ),
            key: _key,
            body: NotificationsContentWidget(
              globalKey: _key,
              isFather: _isFather,
            ));
      },
    );
  }
}
