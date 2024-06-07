import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_addis_post/models/news_provider.dart';

// import '../models/models.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: context.read<NewsProvider>().fetchHeadlineNews(),
        builder: (context, snapshot) => (snapshot.connectionState ==
                ConnectionState.done)
            ? SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      paddWidget(const Header(), size),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          const Divider(),
                          const SizedBox(height: 40),
                          paddWidget(
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 2,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                              size),
                        ],
                      ),
                      paddWidget(
                          Container(
                            width: double.maxFinite,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: (size.width > 767)
                                      ? NewsCard1(
                                          news: context
                                              .watch<NewsProvider>()
                                              .headlineNews[0],
                                        )
                                      : NewsCard1(
                                          news: context
                                              .watch<NewsProvider>()
                                              .headlineNews[0],
                                        ),
                                ),
                                (size.width > 979)
                                    ? const SizedBox(width: 60)
                                    : Container(),
                                (size.width > 979)
                                    ? Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Subscribers only",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Icon(
                                                    Icons
                                                        .arrow_forward_ios_rounded,
                                                    size: 14),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              height: 300,
                                              child: ListView.separated(
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return SubscribersOnlyCard(
                                                    news: context
                                                        .watch<NewsProvider>()
                                                        .headlineNews[index + 10],
                                                  );
                                                },
                                                separatorBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: const Divider(),
                                                  );
                                                },
                                                itemCount: 3,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          size),
                      const SizedBox(height: 40),
                      (size.width > 767)
                          ? paddWidget(
                              SizedBox(
                                height:
                                    (MediaQuery.of(context).size.width > 979)
                                        ? 800
                                        : 1200,
                                child: GridView.builder(
                                  primary: false,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 40,
                                    crossAxisSpacing: 40,
                                    crossAxisCount:
                                        (MediaQuery.of(context).size.width >
                                                979)
                                            ? 3
                                            : 2,
                                  ),
                                  itemBuilder: (context, index) => GridTile(
                                    child: GridNewsItem(
                                      news: context
                                          .watch<NewsProvider>()
                                          .headlineNews[index + 1],
                                    ),
                                  ),
                                  itemCount: 6,
                                ),
                              ),
                              size)
                          : paddWidget(
                              SizedBox(
                                width: size.width,
                                height: 300,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(
                                    width: 200,
                                    child: GridNewsItem(
                                      news: context
                                          .watch<NewsProvider>()
                                          .headlineNews[index + 1],
                                    ),
                                  ),
                                  itemCount: 6,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(width: 20),
                                ),
                              ),
                              size),
                      const SizedBox(height: 40),
                      paddWidget(
                          NewsSection(
                            sectionTitle: 'Sport',
                            sectionNews:
                                context.watch<NewsProvider>().sportNews,
                          ),
                          size),
                      paddWidget(
                          NewsSection(
                            sectionTitle: 'Business',
                            sectionNews:
                                context.watch<NewsProvider>().businessNews,
                          ),
                          size),
                      paddWidget(
                          NewsSection(
                            sectionTitle: 'Life & Style',
                            sectionNews:
                                context.watch<NewsProvider>().lifeAndStyleNews,
                          ),
                          size),
                      const SizedBox(height: 40),
                      Divider(),
                      paddWidget(Footer(), size),
                    ],
                  ),
                ),
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget paddWidget(Widget widget, Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: widget,
    );
  }
}
