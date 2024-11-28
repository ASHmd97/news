import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';

import 'package:news/news/view/widgets/news_list.dart';
import 'package:news/sources/view/widgets/tab_item.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.sources, {super.key});

  final List<Source> sources;

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
                      name: source.name ?? '',
                      isSelected:
                          widget.sources.indexOf(source) == selectedTabIndex,
                    ))
                .toList(),
          ),
        ),
        Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: NewsList(widget.sources[selectedTabIndex].id!)),
        )
      ],
    );
  }
}
