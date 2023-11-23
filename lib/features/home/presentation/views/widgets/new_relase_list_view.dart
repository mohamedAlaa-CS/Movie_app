import 'package:flutter/material.dart';

import 'new_relased_list_view_item.dart';

class NewRelaseListView extends StatelessWidget {
  const NewRelaseListView({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.height / 6,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: media.width / 32,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (contetxt, index) => const NewsRelaseListViewItem()),
    );
  }
}
