import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';

class TabItem extends StatelessWidget {
  const TabItem({super.key, required this.name, required this.isSelected});

  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
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
