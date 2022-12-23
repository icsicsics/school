import 'package:flutter/material.dart';
import 'package:schools/presentation/bloc/add_point/add_point_bloc.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_header_widget.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_list_widget.dart';

class AddPointContentWidget extends StatefulWidget {
  final AddPointBloc addPointBloc;

  const AddPointContentWidget({Key? key, required this.addPointBloc})
      : super(key: key);

  @override
  State<AddPointContentWidget> createState() => _AddPointContentWidgetState();
}

class _AddPointContentWidgetState extends State<AddPointContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddPointHeaderWidget(),
        AddPointListWidget(
          addPointBloc: widget.addPointBloc,
        )
      ],
    );
  }
}
