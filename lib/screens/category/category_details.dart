

import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/source.dart';
import 'package:news/screens/tabs/sources_tabs.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.model});
  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    List<Source> sources = List.generate(
      10,
      (index) => Source(id: '$index', name: 'Source $index'),
    );
    return SourcesTabs(sources);
  }
}
