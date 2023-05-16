import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/custom_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneErrorDialogWidget extends StatefulWidget {
  final String textMessage;
  final String language;

  const PhoneErrorDialogWidget({
    Key? key,
    required this.textMessage,
    required this.language,
  }) : super(key: key);

  @override
  State<PhoneErrorDialogWidget> createState() => _PhoneErrorDialogWidgetState();
}

class _PhoneErrorDialogWidgetState extends State<PhoneErrorDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: widget.language == "ar" ? 382 : 442,
        decoration:  BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            SvgPicture.asset(
              ImagesPath.phoneError,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: BoldTextWidget(
                  text: widget.textMessage,
                  fontSize: 16,
                  height: 2,
                  textAlign: TextAlign.center,
                  color: ColorsManager.darkGrayColor),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: BoldTextWidget(
                  text: S.of(context).toLearnMoreAboutEjabi,
                  fontSize: 16,
                  height: 2,
                  textAlign: TextAlign.center,
                  color: ColorsManager.grayColor),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _item(
                      onTap: () {
                        _launchUrl("http://ejabiapp.com/");
                      },
                      icon: ImagesPath.webIcon),
                  _item(
                      onTap: () {
                        _launchUrl("https://youtu.be/qgiW50-0AGQ");
                      },
                      icon: ImagesPath.youtubeIcon),
                  _item(onTap: () {
                    launchWhatsapp("+962795191633");
                  }, icon: ImagesPath.whatsIcon),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CustomButtonWidget(
                buttonWidth: MediaQuery.of(context).size.width / 3,
                onPressed: () => Navigator.pop(context),
                buttonText: S.of(context).phoneErrorOk,
                borderRadius: 25,
                buttonColor: ColorsManager.secondaryColor,
                borderColor: ColorsManager.secondaryColor,
                buttonTextColor: ColorsManager.whiteColor),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _item({required Function() onTap, required String icon}) => Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              matchTextDirection: false,
              icon,
              width: 24,
              height: 24,
            ),
          ),
        ),
      );

  void  launchWhatsapp(String whatsappNumber) async {
    await canLaunchUrl(Uri.parse(whatsappNumber))
        ? launchUrl(Uri.parse(whatsappNumber))
        : launch("https://wa.me/$whatsappNumber");
  }
}
