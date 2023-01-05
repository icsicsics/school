import 'package:flutter/material.dart';
import 'package:schools/data/source/remote/model/father_info/response/father_info_response.dart';
import 'package:schools/data/source/remote/model/teacher_info/response/teacher_info_response.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_item_widget.dart';

class ProfileInfoContentWidget extends StatelessWidget {
  final TeacherInfoResponse teacherInfoResponse;
  final FatherInfoResponse fatherInfoResponse;
  final bool isFather;

  const ProfileInfoContentWidget(
      {Key? key,
      required this.teacherInfoResponse,
      required this.fatherInfoResponse,
      required this.isFather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItemWidget(
          title: S.of(context).mobileNumber,
          subTitle: isFather
              ? fatherInfoResponse.data!.phoneNumber.toString()
              : teacherInfoResponse.data!.phoneNumber.toString(),
          icon: Icons.phone_android,
          onTap: () {},
        ),
        // ProfileItemWidget(
        //   title: 'Land-line Number',
        //   subTitle: '+9626 589 0691',
        //   icon: Icons.phonelink,
        //   onTap: () {},
        // ),
        ProfileItemWidget(
          title: S.of(context).email,
          subTitle: isFather
              ? fatherInfoResponse.data!.parentName.toString()
              : teacherInfoResponse.data!.email.toString(),
          icon: Icons.mark_email_read,
          onTap: () {},
        ),
        // ProfileItemWidget(
        //   title: ' Current Address',
        //   subTitle: 'Khalda - tlaa al ali',
        //   icon: Icons.location_disabled_sharp,
        //   onTap: () {},
        // ),
        // ProfileItemWidget(
        //   title: ' Permanent Address',
        //   subTitle: 'Permanent Address',
        //   icon: Icons.location_on,
        //   onTap: () {},
        // ),
      ],
    );
  }
}
