import 'package:flutter/material.dart';

import '../../../../../core/utils/color.dart';
import '../../../data/model/onboarding_data_model.dart';

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
            style: TextStyle(
                color: kPrimaryColor.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 40)
      ],
    );
  }
}
