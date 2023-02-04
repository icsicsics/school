import 'package:flutter/material.dart';
import 'package:schools/core/base_widget/base_statful_widget.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/presentation/shere_widgets/bold_text_widget.dart';
import 'package:schools/presentation/ui/web_view/widgets/web_view_html_content_widget.dart';
import 'package:schools/presentation/ui/web_view/widgets/web_view_widget.dart';

class WebViewScreen extends BaseStatefulWidget {
  final bool isUrlContent;
  final String content;
  final String screenTitle;

  const WebViewScreen({
    Key? key,
    required this.isUrlContent,
    required this.content,
    required this.screenTitle,
  }) : super(key: key);

  @override
  BaseState<BaseStatefulWidget> baseCreateState() => _WebViewScreenState();
}

class _WebViewScreenState extends BaseState<WebViewScreen> {
  @override
  Widget baseBuild(BuildContext context) {
    return _buildScreen();
  }

  Widget _buildScreen() {
    return Container(
      color: ColorsManager.backgroundColor,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios,
                  color: ColorsManager.whiteColor)),
          backgroundColor: ColorsManager.primaryColor,
          title: BoldTextWidget(
              text: widget.screenTitle,
              fontSize: 20,
              color: ColorsManager.whiteColor,
              textAlign: TextAlign.center),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                  child: widget.isUrlContent
                      ? WebViewWidget(webViewUrl: widget.content)
                      : WebViewHtmlContentWidget(
                          webViewHtmlContent: widget.content)),
            ],
          ),
        ),
      ),
    );
  }
}
