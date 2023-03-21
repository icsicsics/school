import 'package:flutter/material.dart';
import 'package:schools/presentation/widgets/custom_app_bar_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;
  final String imagePath;
  final Function() onTap;

  const CustomAppBar(
      {Key? key,
      required this.appBarTitle,
      required this.imagePath,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            appBarTitle,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        CustomAppBarIcon(
          imagePath: imagePath,
          onTap: onTap,
        ),
      ],
    );
  }
}
