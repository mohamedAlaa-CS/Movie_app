import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/new_relase_section.dart';
import 'package:movie/features/home/presentation/views/widgets/recomended_section.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_widget.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:
          CustomScrollView(physics: NeverScrollableScrollPhysics(), slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopSideWidget(),
              SizedBox(height: 30),
              NewRelaseSection(),
              SizedBox(height: 20),
              RecomendedSection()
            ],
          ),
        )
      ]),
    );
  }
}
