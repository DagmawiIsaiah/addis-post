import 'package:flutter/material.dart';

import '../models/models.dart';

class NewsCard1 extends StatelessWidget {
  final News news;
  const NewsCard1({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 700,
      color: Colors.grey.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            // child: Image.asset(news.imageUrl),
            child: Image.network(
              news.imageUrl,
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(news.tag.name,
                    style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                Text(news.title, style: Theme.of(context).textTheme.titleLarge),
                const Spacer(),
                Text(news.description,
                    style: Theme.of(context).textTheme.bodyLarge),
                const Spacer(flex: 3),
                Row(
                  children: [
                    Text(news.date.year.toString(),
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(width: 40),
                    const Icon(
                      Icons.timer_outlined,
                      size: 14,
                      color: Colors.black54,
                    ),
                    Text(news.minRead.toString(),
                        style: Theme.of(context).textTheme.bodySmall),
                    Text("min read",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}
