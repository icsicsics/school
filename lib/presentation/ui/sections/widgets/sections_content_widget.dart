import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/bloc/sections/sections_bloc.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/sections/widgets/sections_header_widget.dart';

class SectionsContentWidget extends StatefulWidget {
  final SectionsBloc bloc;

  const SectionsContentWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  State<SectionsContentWidget> createState() => _SectionsContentWidgetState();
}

class _SectionsContentWidgetState extends State<SectionsContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SectionsHeaderWidget(),
        const SizedBox(
          height: 50,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () => widget.bloc.add(NavigateToAddPointScreenEvent()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImagesPath.points, height: 80),
                  const SizedBox(height: 15),
                  BoldTextWidget(
                      text: S.of(context).points,
                      fontSize: 15,
                      color: ColorsManager.borderColor)
                ],
              ),
            ),
            InkWell(
              onTap: () => widget.bloc.add(NavigateToHomeScreenEvent()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImagesPath.school, height: 80),
                  const SizedBox(height: 15),
                  BoldTextWidget(
                      text: S.of(context).schoolHomes,
                      fontSize: 15,
                      color: ColorsManager.blackColor)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
