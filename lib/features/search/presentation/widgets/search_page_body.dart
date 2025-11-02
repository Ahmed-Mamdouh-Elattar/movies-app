import 'package:flutter/widgets.dart';
import 'package:movies_app/core/helper/constants.dart';
import 'package:movies_app/features/search/presentation/widgets/search_result_list_builder.dart';
import 'package:movies_app/features/search/presentation/widgets/search_text_field.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          SearchTextField(),
          SizedBox(height: 20),
          Expanded(child: SearchResultListBuilder()),
        ],
      ),
    );
  }
}
