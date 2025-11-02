import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/routing/page_name.dart';

class SearchContainerButton extends StatelessWidget {
  const SearchContainerButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(PageName.search),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search',
              style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
            ),
            const Icon(Icons.search, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
