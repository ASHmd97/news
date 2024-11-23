// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.name, required this.isSelected});

  String name;
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppTheme.primary),
          borderRadius: BorderRadius.circular(25),
          color: isSelected ? AppTheme.primary : Colors.transparent),
      child: Text(
        name,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: isSelected ? AppTheme.white : AppTheme.primary,
            ),
      ),
    );
  }
}
