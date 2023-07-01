import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatefulWidget {
  const SocialMediaWidget({Key? key}) : super(key: key);

  @override
  State<SocialMediaWidget> createState() => _SocialMediaWidgetState();
}

class _SocialMediaWidgetState extends State<SocialMediaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _item(
            onTap: () {},
            icon: FontAwesomeIcons.facebook,
          ),
          _item(
            onTap: () {},
            icon: FontAwesomeIcons.instagram,
          ),
          _item(
            onTap: () {},
            icon: FontAwesomeIcons.twitter,
          ),
          _item(
            onTap: () {
              _launchUrl("https://youtu.be/qgiW50-0AGQ");
            },
            icon: FontAwesomeIcons.youtube,
          ),
          _item(
            onTap: () {
              _launchUrl("http://ejabiapp.com/");
            },
            icon: Icons.language,
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _item({
    required IconData icon,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}