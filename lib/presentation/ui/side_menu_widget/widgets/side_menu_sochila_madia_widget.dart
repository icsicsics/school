import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenuSocialMediaWidget extends StatefulWidget {
  const SideMenuSocialMediaWidget({Key? key}) : super(key: key);

  @override
  State<SideMenuSocialMediaWidget> createState() =>
      _SideMenuSocialMediaWidgetState();
}

class _SideMenuSocialMediaWidgetState extends State<SideMenuSocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _item(onTap: () {}, icon: FontAwesomeIcons.facebook),
          _item(onTap: () {}, icon: FontAwesomeIcons.instagram),
          _item(onTap: () {}, icon: FontAwesomeIcons.twitter),
          _item(onTap: () {}, icon: FontAwesomeIcons.youtube),
        ],
      ),
    );
  }

  Widget _item({required Function() onTap, required IconData icon}) =>
      IconButton(onPressed: onTap, icon: Icon(icon, color: Colors.white));
}
