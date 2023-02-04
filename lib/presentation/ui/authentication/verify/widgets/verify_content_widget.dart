import 'package:flutter/material.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/shere_widgets/dialogs/show_error_dialg_function.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/submit_button_widget.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/pin_code_field_widget.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/send_agin_widget.dart';
import 'package:schools/presentation/ui/authentication/verify/widgets/verify_title_widget.dart';
import 'package:schools/presentation/ui/home/home_screen.dart';

class VerifyContentWidget extends StatefulWidget {
  final String language;

  const VerifyContentWidget({Key? key, required this.language})
      : super(key: key);

  @override
  State<VerifyContentWidget> createState() => _VerifyContentWidgetState();
}

class _VerifyContentWidgetState extends State<VerifyContentWidget> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const VerifyTitleWidget(),
                sizedBox(height: 30),
                PinCodeTextFiledWidget(
                  pinController: pinController,
                  onChanged: (value) {},
                  language: widget.language,
                ),
                sizedBox(height: 30),
                SubmitButtonWidget(
                  submitAction: () {
                    if (pinController.text == "1234") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HomeScreen()));
                    } else {
                      showErrorDialogFunction(
                          context: context,
                          textMessage: S.of(context).errorActivationCode);
                    }
                  },
                ),
                sizedBox(height: 20),
                SendAgainWidget(onTap: () {}),
                sizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  sizedBox({double height = 35}) => SizedBox(
        height: height,
      );
}
