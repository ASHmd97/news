import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/models/news_response/article.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem(this.article, {super.key});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ??
                ('https://st2.depositphotos.com/2586633/46477/v/600/depositphotos_464771766-stock-illustration-no-photo-or-blank-image.jpg'),
            height: MediaQuery.sizeOf(context).height * 0.25,
            width: double.infinity,
            fit: BoxFit.fill,
            placeholder: (_, __) => const LoadingIndicator(),
            errorWidget: (_, __, ___) =>
                const Icon(Icons.image_not_supported_outlined),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          article.source?.name ?? '',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 4),
        Text(
          article.title ?? '',
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            timeago.format(DateTime.parse(article.publishedAt!)),
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppTheme.gray),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
