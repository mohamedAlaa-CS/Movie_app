import 'package:flutter/material.dart';
import 'package:movie/core/utils/assets.dart';
import 'package:movie/core/utils/color.dart';

class OnBoardingView extends StatelessWidget {
  static const String routeName = "/onboarding";
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
  var pageController = PageController();
  OnBoardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'SKIP',
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                itemCount: onBoarding.length,
                itemBuilder: (context, index) => PageViewItem(
                      model: onBoarding[index],
                    )),
          ),
          Row(
            children: [
              const Text('undecaror'),
              const Spacer(),
              FloatingActionButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeInOut);
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

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.model,
  });
  final OnboardingData model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage(model.image))),
        Text(
          model.title,
          style: const TextStyle(
              color: kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.4,
          child: Text(
            model.body,
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}

class OnboardingData {
  final String image;
  final String title;
  final String body;

  OnboardingData({
    required this.image,
    required this.title,
    required this.body,
  });
}
