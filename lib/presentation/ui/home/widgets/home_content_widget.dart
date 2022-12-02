import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/home/widgets/home_app_bar_widget.dart';
import 'package:schools/presentation/ui/home/widgets/home_list_widget.dart';
import 'package:schools/presentation/ui/home/widgets/title_widget.dart';

class HomeContentWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> globalKey;

  const HomeContentWidget({Key? key, required this.globalKey})
      : super(key: key);

  @override
  State<HomeContentWidget> createState() => _HomeContentWidgetState();
}

class _HomeContentWidgetState extends State<HomeContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBarWidget(
          onTapMenu: () => widget.globalKey.currentState!.openDrawer(),
        ),
        const SizedBox(height: 5),
        const TitleWidget(),
        const HomeListWidget()
      ],
    );
  }
}
