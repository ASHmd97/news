import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category/category_item.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = [
      CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'ball',
        color: AppTheme.red,
      ),
      CategoryModel(
        id: 'sports',
        name: 'Politics',
        imageName: 'Politics',
        color: AppTheme.blue,
      ),
      CategoryModel(
        id: 'sports',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      CategoryModel(
        id: 'sports',
        name: 'Business',
        imageName: 'business',
        color: AppTheme.brown,
      ),
      CategoryModel(
        id: 'sports',
        name: 'Environment',
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      CategoryModel(
        id: 'sports',
        name: 'Science',
        imageName: 'science',
        color: AppTheme.yellow,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Text('Pick your category\nof interest',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.navy,
                    )),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
              ),
              itemBuilder: (context, index) => CategoryItem(
                index: index,
                category: categoryList[index],
              ),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
