// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/screens/category/category_grid.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(image: AssetImage('assets/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: const CategoryGrid(),
      ),
    );
  }
}
