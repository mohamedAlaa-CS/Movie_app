import 'package:flutter/material.dart';
import 'package:movie/features/brawser/presentation/view/widgets/brawser_category_details_list_view.dart';
import 'package:movie/features/search/presentation/manager/search%20cubit/search_cubit.dart';

class BrawserCategoryDetails extends StatefulWidget {
  static const String routeName = '/brawser_details_view';

  const BrawserCategoryDetails({super.key, required this.query});
  final String query;

  @override
  State<BrawserCategoryDetails> createState() => _BrawserCategoryDetailsState();
}

class _BrawserCategoryDetailsState extends State<BrawserCategoryDetails> {
  @override
  void initState() {
    SearchCubit.get(context).featchCategorySearch(query: widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.query,
        ),
        centerTitle: true,
      ),
      body: const BrawserCategoryDetailsListView(),
    );
  }
}
