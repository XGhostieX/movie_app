import 'package:flutter/material.dart';

import 'Search_field.dart';
import 'search_gridview.dart';
import 'search_options.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(),
          SizedBox(height: 15),
          SearchOptions(),
          SizedBox(height: 15),
          Expanded(child: SearchGridview()),
        ],
      ),
    );
  }
}
