import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schools/presentation/bloc/my_children/my_children_bloc.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_body_widget.dart';
import 'package:schools/presentation/ui/my_children/widget/my_children_header_widget.dart';

class MyChildrenContentWidget extends StatefulWidget {
  const MyChildrenContentWidget({Key? key}) : super(key: key);

  @override
  State<MyChildrenContentWidget> createState() =>
      _MyChildrenContentWidgetState();
}

class _MyChildrenContentWidgetState extends State<MyChildrenContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [MyChildrenHeaderWidget(),MyChildrenBodyWidget()],
      ),
    );
  }
}
