import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category/category_details.dart';
import 'package:news/screens/category/category_grid.dart';
import 'package:news/screens/setting/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categorySelected;
  DrawerItem drawerSelected = DrawerItem.categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(image: AssetImage('assets/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            categorySelected != null
                ? categorySelected!.name
                : drawerSelected == DrawerItem.categories
                    ? 'News App'
                    : 'Settings',
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: categorySelected != null
            ? CategoryDetails(categoryId: categorySelected!.id)
            : drawerSelected == DrawerItem.categories
                ? CategoryGrid(
                    onCategoryClicked: onCategorySelected,
                  )
                : const SettingTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    drawerSelected = item;
    categorySelected = null;
    setState(() {});
    Navigator.pop(context);
  }

  void onCategorySelected(CategoryModel category) {
    categorySelected = category;
    setState(() {});
  }
}
