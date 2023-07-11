import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/config/routes/app_routes.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
import 'package:schools/presentation/screens/channels/channels_screen.dart';
import 'package:schools/presentation/screens/on_boarding/widgets/on_boarding_page_widget.dart';
import 'package:schools/presentation/widgets/bold_text_widget.dart';
import 'package:schools/presentation/widgets/medium_text_widget.dart';
import 'package:schools/presentation/widgets/regular_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            PageView(
              onPageChanged: (index) {
                _currentPage = index;
                setState(() {});
              },
              controller: _pageController,
              children: [
                OnBoardingPageWidget(
                  title: S.of(context).connectLikeMindedPeople,
                  description: S.of(context).pageOne,
                  imagePath: ImagesPath.pageOne,
                ),
                OnBoardingPageWidget(
                  title: S.of(context).participateAndWinRewards,
                  description: S.of(context).pageTwo,
                  imagePath: ImagesPath.pageTwo,
                ),
                OnBoardingPageWidget(
                  title: S.of(context).findNearbyEvents,
                  description: S.of(context).pageThree,
                  imagePath: ImagesPath.pageThree,
                ),
              ],
            ),
            _buildSkipButton(),
          ],
        ),
        bottomSheet: _buildOnBoardingFooter(),
      ),
    );
  }

  Positioned _buildSkipButton() {
    return Positioned(
      top: 16,
      right: 16,
      child: InkWell(
        onTap: () {
          _setIsOnBoardingValue();
          _navigateToChannelsScreen();
        },
        child: Text(
          S.of(context).skip,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 16,
                color: ColorsManager.grayColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }

  Container _buildOnBoardingFooter() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            onDotClicked: (index) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            effect: const WormEffect(
                activeDotColor: ColorsManager.primaryColor,
                dotColor: Colors.black26,
                spacing: 12,
                dotHeight: 12,
                dotWidth: 12),
          ),
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () async {
              if (_currentPage == 2) {
                _setIsOnBoardingValue();
                _navigateToChannelsScreen();
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              }
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text(
              _currentPage == 2 ? S.of(context).getStart : S.of(context).next,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: ColorsManager.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  void _setIsOnBoardingValue() async {
    await SharedPreferencesManager.setIsOnBoarding(true);
  }

  void _navigateToChannelsScreen() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.channels,
      (route) => false,
      arguments: "ejabi"
    );
  }
}
