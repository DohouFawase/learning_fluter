import 'package:flutter/material.dart';
import 'package:my_flutter_app/domain/entities/category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(label: Text(categories[index].name)),
          );
        },
      ),
    );
  }
}
