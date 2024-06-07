import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class NewsSection extends StatelessWidget {
  final String sectionTitle;
  final List<News> sectionNews;
  const NewsSection(
      {super.key, required this.sectionTitle, required this.sectionNews});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 30),
          Container(
            width: size.width * 0.8,
            height: 320,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GridNewsItem(
                    news: sectionNews[0],
                  ),
                ),
                (size.width > 767) ? const SizedBox(width: 40) : Container(),
                (size.width > 767)
                    ? Expanded(
                        child: SectionCard(),
                      )
                    : Container(),
                (size.width > 767) ? const SizedBox(width: 40) : Container(),
                (size.width > 979)
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return SubscribersOnlyCard(
                              news: sectionNews[index + 1],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: const Divider(),
                            );
                          },
                          itemCount: 3,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          if (size.width < 979)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: size.width,
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: 280,
                  child: SubscribersOnlyCard(
                    news: sectionNews[index + 1],
                  ),
                ),
                itemCount: 6,
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 20),
              ),
            ),
        ],
      ),
    );
  }
}
