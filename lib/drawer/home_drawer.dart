import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});

  final void Function(DrawerItem) onItemSelected;

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    TextStyle? largeTitleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: sizeScreen.width * 0.8,
      child: Column(
        children: [
          Container(
            height: sizeScreen.height * 0.2,
            alignment: Alignment.center,
            color: AppTheme.primary,
            child: Text(
              'News App!',
              style: largeTitleStyle?.copyWith(letterSpacing: .9),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppTheme.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        onItemSelected(DrawerItem.categories);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.list,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Category',
                            style: largeTitleStyle?.copyWith(
                              color: AppTheme.black,
                              letterSpacing: .9,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        onItemSelected(DrawerItem.settings);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.settings,
                            size: 40,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Settings',
                            style: largeTitleStyle?.copyWith(
                              color: AppTheme.black,
                              letterSpacing: .9,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerItem {
  categories,
  settings,
}
