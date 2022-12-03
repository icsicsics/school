import 'package:flutter/widgets.dart';
import 'package:schools/presentation/ui/add_point/widgets/add_point_item_widget.dart';

class AddPointListWidget extends StatefulWidget {
  const AddPointListWidget({Key? key}) : super(key: key);

  @override
  State<AddPointListWidget> createState() => _AddPointListWidgetState();
}

class _AddPointListWidgetState extends State<AddPointListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 5),
      itemCount: 20,
      padding: const EdgeInsets.all(5),
      shrinkWrap: false,
      semanticChildCount: 10,
      itemBuilder: (BuildContext context, int index) {
      return const AddPointItemWidget();
          }),
    );
  }
}
