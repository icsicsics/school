import 'package:flutter/material.dart';
import 'package:schools/presentation/bloc/profile/profile_bloc.dart';
import 'package:schools/presentation/ui/profile/widgets/father_of_widget.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_header_widget.dart';
import 'package:schools/presentation/ui/profile/widgets/profile_info_content_widget.dart';

class ProfileContentWidget extends StatefulWidget {
  final bool isFather;
  final String profileImage;
  final ProfileBloc bloc;

  const ProfileContentWidget(
      {Key? key, required this.isFather, required this.profileImage,required this.bloc})
      : super(key: key);

  @override
  State<ProfileContentWidget> createState() => _ProfileContentWidgetState();
}

class _ProfileContentWidgetState extends State<ProfileContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeaderWidget(bloc: widget.bloc,profileImage: widget.profileImage),
          const ProfileInfoContentWidget(),
          widget.isFather ? const FatherOfWidget() : const SizedBox()
        ],
      ),
    );
  }
}
