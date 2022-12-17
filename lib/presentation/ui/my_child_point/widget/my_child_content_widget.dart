import 'package:flutter/material.dart';
import 'package:schools/presentation/bloc/my_child_points/my_child_points_bloc.dart';
import 'package:schools/presentation/ui/my_child_point/widget/my_child_body_widget.dart';
import 'package:schools/presentation/ui/my_child_point/widget/my_child_header_widget.dart';

class MyChildContentWidget extends StatefulWidget {
  final MyChildPointsBloc bloc;

  const MyChildContentWidget({Key? key, required this.bloc}) : super(key: key);

  @override
  State<MyChildContentWidget> createState() => _MyChildContentWidgetState();
}

class _MyChildContentWidgetState extends State<MyChildContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MyChildHeaderWidget(),
          const SizedBox(
            height: 50,
          ),
          MyChildBodyWidget(bloc: widget.bloc)
        ],
      ),
    );
  }
}
