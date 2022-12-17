import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/bloc/sections/sections_bloc.dart';
import 'package:schools/presentation/shere_widgets/medium_text_widget.dart';
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
          height: 100,
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
                children: const [
                  Icon(
                    Icons.star,
                    color: ColorsManager.yellow,
                    size: 70,
                  ),
                  SizedBox(height: 15),
                  MediumTextWidget(
                      text: "Points",
                      fontSize: 15,
                      color: ColorsManager.mediumGrayColor),
                ],
              ),
            ),
            InkWell(
              onTap: () => widget.bloc.add(NavigateToHomeScreenEvent()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.school_sharp,
                    color: ColorsManager.yellow,
                    size: 70,
                  ),
                  SizedBox(height: 15),
                  MediumTextWidget(
                      text: " School Homes",
                      fontSize: 15,
                      color: ColorsManager.mediumGrayColor),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
