import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/core/base/widget/base_stateful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/data/source/remote/model/notification/request/notification_request.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/notifications/notifications_bloc.dart';
import 'package:schools/presentation/screens/notifications/widgets/notifications_content_widget.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';

class NotificationsScreen extends BaseStatefulWidget {
  final bool isNotificationSelected;

  NotificationsScreen({
    super.key,
    this.isNotificationSelected = true,
  });

  @override
  BaseState<BaseStatefulWidget> baseCreateState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseState<NotificationsScreen> {
  NotificationsBloc get _bloc => BlocProvider.of<NotificationsBloc>(context);
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _isFather = false;
  String _language = '';
  String _token = '';
  List<NotificationItem> notifications = List.empty(growable: true);
  List<NotificationItem> inboxNotifications = List.empty(growable: true);

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
        if (state is ShowLoadingState) {
          showLoading();
        } else if (state is HideLoadingState) {
          hideLoading();
        } else if (state is GetIsFatherState) {
          _isFather = state.isFather;
          _bloc.add(GetInboxNotificationsEvent(
              notificationRequest:
                  NotificationRequest(pageNo: 1, pageSize: 10)));
          if (_isFather) {
            _bloc.add(GetNotificationsEvent(
                notificationRequest:
                    NotificationRequest(pageNo: 1, pageSize: 10)));
          }
        } else if (state is GetLanguageSuccessState) {
          _language = state.language;
          _bloc.add(GetTokenEvent());
        } else if (state is GetTokenSuccessState) {
          _token = state.token;
        } else if (state is GetNotificationsSuccessState) {
          notifications = state.notificationResponse.notificationItem ?? [];
        } else if (state is GetNotificationsFillState) {
        } else if (state is GetInboxNotificationsSuccessState) {
          inboxNotifications =
              state.notificationResponse.notificationItem ?? [];
        } else if (state is GetInboxNotificationsFillState) {
        } else if (state is UpdateNotificationSuccessState) {
          _bloc.add(GetInboxNotificationsEvent(
              notificationRequest:
                  NotificationRequest(pageNo: 1, pageSize: 10)));
          if (_isFather) {
            _bloc.add(GetNotificationsEvent(
                notificationRequest:
                    NotificationRequest(pageNo: 1, pageSize: 10)));
          }
        } else if (state is UpdateNotificationFailState) {}
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Color(0xFFf6f2f2),
            appBar: _appBar(),
            key: _key,
            body: NotificationsContentWidget(
              globalKey: _key,
              isFather: _isFather,
              notifications: notifications,
              inboxNotifications: inboxNotifications,
              isNotificationSelected: widget.isNotificationSelected,
            ));
      },
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
    backgroundColor:Color(0xFFf6f2f2) ,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios,
            color: ColorsManager.secondaryColor, size: 25),
      ),
      centerTitle: false,
      title: BoldTextWidget(
        color: ColorsManager.secondaryColor,
        fontSize: 20,
        text: _isFather
            ? widget.isNotificationSelected
                ? S.of(context).notifications
                : S.of(context).inbox
            : S.of(context).inbox,
      ));
}
