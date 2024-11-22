// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/drawer/home_drawer.dart';
import 'package:news/screens/category/category_grid.dart';
import 'package:news/screens/setting/setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem drawerSelected = DrawerItem.categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(image: AssetImage('assets/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'News App',
          ),
        ),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemSelected,
        ),
        body: drawerSelected == DrawerItem.categories
            ? const CategoryGrid()
            : const SettingTab(),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem item) {
    drawerSelected = item;
    setState(() {});
    Navigator.pop(context);
  }
}
