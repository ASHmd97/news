import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.index, required this.category});

  final int index;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(25),
          topEnd: const Radius.circular(25),
          bottomStart: Radius.circular(index.isEven ? 25 : 0),
          bottomEnd: Radius.circular(index.isOdd ? 25 : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/${category.imageName}.png'),
          Text(
            category.name,
            style: Theme.of(context).textTheme.titleLarge,
          )
        ],
      ),
    );
  }
}
