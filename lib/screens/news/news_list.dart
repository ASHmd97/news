import 'package:flutter/material.dart';
import 'package:news/api/api_service.dart';
import 'package:news/screens/news/news_item.dart';
import 'package:news/widgets/error_indicator.dart';

import 'package:news/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSourcesNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final news = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) => NewsItem(news[index]),
            itemCount: news.length,
          );
        }
      },
    );
  }
}
