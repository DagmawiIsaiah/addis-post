import 'package:flutter/material.dart';

import '../models/models.dart';

class GridNewsItem extends StatelessWidget {
  final News news;
  const GridNewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.network(
              news.imageUrl,
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Politica",
                      style: Theme.of(context).textTheme.bodySmall),
                ),
                Text(news.title, style: Theme.of(context).textTheme.titleLarge),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Text("3 Oct, 2024",
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 40),
                      const Icon(
                        Icons.timer,
                        size: 14,
                        color: Colors.black54,
                      ),
                      Text("5", style: Theme.of(context).textTheme.bodySmall),
                      Text("min read",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
