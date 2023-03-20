import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/widgets/custom_button_widget.dart';

class OkDialogWidget extends StatelessWidget {
  final String dialogMessage;
  final Function() onTap;

  const OkDialogWidget({
    Key? key,
    required this.dialogMessage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              Icons.notifications,
              color: ColorsManager.yellow,
           ),
            const SizedBox(height: 14),
            Expanded(
              child: Text(
                dialogMessage,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 144,
              child: CustomButtonWidget(
                buttonText: S.of(context).ok,
                onPressed: onTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
