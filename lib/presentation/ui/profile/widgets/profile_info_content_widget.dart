import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_item_widget.dart';

class ProfileInfoContentWidget extends StatelessWidget {
  const ProfileInfoContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileItemWidget(
          title: 'Mobile Number',
          subTitle: '+9627 970 64513',
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
          title: 'Email',
          subTitle: 'eiz.m@gmail.com',
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
