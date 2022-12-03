import 'package:flutter/material.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_header_widget.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_item_widget.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_list_widget.dart';

class AddPointContentWidget extends StatefulWidget {
  const AddPointContentWidget({Key? key}) : super(key: key);

  @override
  State<AddPointContentWidget> createState() => _AddPointContentWidgetState();
}

class _AddPointContentWidgetState extends State<AddPointContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
         AddPointHeaderWidget(),
        AddPointListWidget()
      ],
    );
  }
}
