import 'package:flutter/material.dart';
import 'package:movie/features/home/presentation/views/widgets/new_relase_section.dart';
import 'package:movie/features/home/presentation/views/widgets/recomended_section.dart';
import 'package:movie/features/home/presentation/views/widgets/top_side_widget.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home_view';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopSideWidget(),
          SizedBox(height: media.height / 40),
          const NewRelaseSection(),
          SizedBox(height: media.height / 50),
          const RecomendedSection()
        ],
      ),
    );
  }
}
