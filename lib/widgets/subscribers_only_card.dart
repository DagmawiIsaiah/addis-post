import 'package:flutter/material.dart';
import 'package:the_addis_post/models/models.dart';

class SubscribersOnlyCard extends StatelessWidget {
  final News news;
  const SubscribersOnlyCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Image.network(news.imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Text(
              news.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
