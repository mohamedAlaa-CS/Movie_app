import 'package:flutter/material.dart';
import 'package:movie/core/utils/assets.dart';
import 'package:movie/core/utils/color.dart';
import 'package:movie/features/onboarding/presentation/view/widget/page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/model/onboarding_data_model.dart';

class OnBoardingView extends StatefulWidget {
  static const String routeName = "/onboarding";

  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  List<OnboardingData> onBoarding = [
    OnboardingData(
        image: Assets.onboarding_1,
        title: 'Your Unforgettable Movie Experience!',
        body:
            'Explore a realm of amazing films, book effortlessly, and enjoy seamless access to your favorite movies through our app.'),
    OnboardingData(
        image: Assets.onboarding_2,
        title: 'Easy Booking, Smooth Movie Access!',
        body:
            'Effortlessly book movies and enjoy smooth access to the world of cinema with our user-friendly app.'),
  ];

  bool last = false;

  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'SKIP ',
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == onBoarding.length - 1) {
                    setState(() {
                      last = true;
                    });
                  } else {
                    setState(() {
                      last = false;
                    });
                  }
                },
                controller: pageController,
                itemCount: onBoarding.length,
                itemBuilder: (context, index) => PageViewItem(
                      model: onBoarding[index],
                    )),
          ),
          Row(
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: onBoarding.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.white,
                  dotWidth: 17,
                  spacing: 8,
                ),
              ),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  if (last) {
                    print('nvigator');
                  } else {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 700),
                        curve: Curves.easeInOut);
                  }
                },
                child: const Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ]),
      ),
    );
  }
}
