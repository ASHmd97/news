// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/models/source.dart';
import 'package:news/screens/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  SourcesTabs(this.sources, {super.key});

  List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            onTap: (index) {
              selectedTabIndex = index;
              setState(() {});
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabs: widget.sources
                .map((source) => TabItem(
                      name: source.name,
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabIndex,
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
