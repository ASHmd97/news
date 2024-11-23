import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final fifteenAgo = DateTime.now().subtract(const Duration(minutes: 15));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl:
                ('https://images.unsplash.com/photo-1729843352938-0e10fbf96585?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDY4fEJuLURqcmNCcndvfHxlbnwwfHx8fHw%3D'),
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
          'BBC News',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(height: 4),
        Text(
          "Why are football's biggest clubs starting a new tournament?",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Text(
            timeago.format(fifteenAgo),
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
