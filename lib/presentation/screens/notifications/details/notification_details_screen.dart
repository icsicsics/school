import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/remote/model/notification/response/notifications_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/custom_app_bar.dart';
import 'package:schools/presentation/widgets/regular_text_widget.dart';

class NotificationDetailsScreen extends StatelessWidget {
  final NotificationItem notificationItem;
  final bool isNotificationSelected;

  const NotificationDetailsScreen({
    required this.notificationItem,
    required this.isNotificationSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            children: [
              _buildAppBar(context),
              const SizedBox(height: 24),
              _buildNotificationCard(),
            ],
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      appBarTitle: S.of(context).notifications,
      imagePath: ImagesPath.arrowBack,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Container _buildNotificationCard() {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 24,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.06))
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffff7f2e)),
                child: Icon(
                  isNotificationSelected == true ? Icons.notifications_none_rounded :  Icons.mail,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(notificationItem.title ?? ""),
              Expanded(
                child: SizedBox(),
              ),
              BoldTextWidget(
                  text: DateFormat("dd/MM/yyyy", "en").format(
                      DateTime.parse(notificationItem.creationDate ?? "")),
                  fontSize: 12,
                  color: ColorsManager.blackColor),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          RegularTextWidget(
            textAlign: TextAlign.start,
            color: Colors.black,
            fontSize: 16,
            text: notificationItem.body ?? "",
          ),
        ],
      ),
    );
  }
}
