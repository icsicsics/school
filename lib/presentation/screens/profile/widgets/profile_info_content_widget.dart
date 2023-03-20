import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/screens/profile/widgets/profile_item_widget.dart';

class ProfileInfoContentWidget extends StatelessWidget {
  final TeacherInfoResponse? teacherInfoResponse;
  final FatherInfoResponse? fatherInfoResponse;
  final bool isFather;

  const ProfileInfoContentWidget(
      {Key? key,
      this.teacherInfoResponse,
      this.fatherInfoResponse,
      required this.isFather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return teacherInfoResponse!.data != null || fatherInfoResponse!.data != null
        ? Column(
            children: [
              ProfileItemWidget(
                title: S.of(context).mobileNumber,
                subTitle: isFather
                    ? fatherInfoResponse!.data!.phoneNumber ?? ""
                    : teacherInfoResponse!.data!.phoneNumber ?? "",
                icon: Icons.phone_android,
                onTap: () {},
              ),
              ProfileItemWidget(
                title: S.of(context).email,
                subTitle: isFather
                    ? fatherInfoResponse!.data!.parentName ?? ""
                    : teacherInfoResponse!.data!.email ?? "",
                icon: Icons.mark_email_read,
                onTap: () {},
              ),
            ],
          )
        : Container();
  }
}
