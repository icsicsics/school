import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:schools/core/utils/resorces/color_manager.dart';
import 'package:schools/core/utils/resorces/image_path.dart';
import 'package:schools/data/source/local/shared_preferences/shared_preferences_manager.dart';
import 'package:schools/generated/l10n.dart';
import 'package:schools/presentation/screens/authentication/login/login_screen.dart';
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
                _buildPage(
                  ImagesPath.pageOne,
                  S.of(context).connectLikeMindedPeople,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget augue nec massa volutpat aliquam.",
                ),
                _buildPage(
                  ImagesPath.pageTwo,
                  S.of(context).participateAndWinRewards,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget augue nec massa volutpat aliquam.",
                ),
                _buildPage(
                  ImagesPath.pageThree,
                  S.of(context).findNearbyEvents,
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget augue nec massa volutpat aliquam.",
                ),
              ],
            ),
            Positioned(
              top: 16,
              right: 16,
              child: InkWell(
                onTap: () async {
                  await SharedPreferencesManager.setIsOnBoarding(true);
                  _navigateToLoginScreen(context);
                },
                child: BoldTextWidget(
                  text: S.of(context).skip,
                  fontSize: 16,
                  color: ColorsManager.grayColor,
                ),
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.white,
          child: Container(
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
                      await SharedPreferencesManager.setIsOnBoarding(true);
                      _navigateToLoginScreen(context);
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
                  child: BoldTextWidget(
                    text: _currentPage == 2
                        ? S.of(context).getStart
                        : S.of(context).next,
                    fontSize: 16,
                    color: ColorsManager.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
      return const LoginScreen();
    }), (route) => false);
  }

  Container _buildPage(
    String imagePath,
    String title,
    String description,
  ) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          BoldTextWidget(
            text: title,
            fontSize: 16,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: MediumTextWidget(
              text: description,
              textAlign: TextAlign.center,
              fontSize: 16,
              color: ColorsManager.grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
