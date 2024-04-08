import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_cubit.dart';
import 'package:movie/features/search/presentation/views/widgets/search_list_view.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  static const String routeName = '/search_view';

  var searchController = TextEditingController();

  SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                cubit.featchSearch(query: value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff514F4F),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
                prefixIcon: IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.magnifyingGlass,
                  ),
                  color: Colors.white,
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const SearchListView()
          ],
        ),
      ),
    );
  }
}
