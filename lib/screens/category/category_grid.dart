import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category/category_item.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key, required this.onCategoryClicked});

  final void Function(CategoryModel) onCategoryClicked;
 
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = [
      const CategoryModel(
        id: 'sports',
        name: 'Sports',
        imageName: 'ball',
        color: AppTheme.red,
      ),
      const CategoryModel(
        id: 'technology',
        name: 'Politics',
        imageName: 'Politics',
        color: AppTheme.blue,
      ),
      const CategoryModel(
        id: 'health',
        name: 'Health',
        imageName: 'health',
        color: AppTheme.pink,
      ),
      const CategoryModel(
        id: 'business',
        name: 'Business',
        imageName: 'business',
        color: AppTheme.brown,
      ),
      const CategoryModel(
        id: 'entertainment',
        name: 'Environment',
        imageName: 'environment',
        color: AppTheme.lightBlue,
      ),
      const CategoryModel(
        id: 'science',
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
              itemBuilder: (context, index) => InkWell(
                onTap: () => onCategoryClicked(categoryList[index]),
                child: CategoryItem(
                  index: index,
                  category: categoryList[index],
                ),
              ),
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
