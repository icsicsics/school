import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/profile/widgets/father_of_widget.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_header_widget.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_info_content_widget.dart';

class ProfileContentWidget extends StatefulWidget {
  const ProfileContentWidget({Key? key}) : super(key: key);

  @override
  State<ProfileContentWidget> createState() => _ProfileContentWidgetState();
}

class _ProfileContentWidgetState extends State<ProfileContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:const  [
          ProfileHeaderWidget(),
          ProfileInfoContentWidget(),
          FatherOfWidget()

        ],
      ),
    );
  }
}
