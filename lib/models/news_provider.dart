import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/news.dart';

class NewsProvider extends ChangeNotifier {
  List<News> headlineNews = [];
  List<News> sportNews = [];
  List<News> businessNews = [];
  List<News> lifeAndStyleNews = [];

  Future fetchHeadlineNews() async {
    String apiKey = dotenv.env['API_KEY']!;
    final newsUrl = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey');

    final businessUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9f2866409a4944c1ba80d1a6c67e0371",
    );

    final sportUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=9f2866409a4944c1ba80d1a6c67e0371",
    );

    final entertainmentUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=entertainment&apiKey=9f2866409a4944c1ba80d1a6c67e0371",
    );

    await addNewsToList(newsUrl, headlineNews, Tag.politics);
    await addNewsToList(businessUrl, businessNews, Tag.bussiness);
    await addNewsToList(sportUrl, sportNews, Tag.sport);
    await addNewsToList(entertainmentUrl, lifeAndStyleNews, Tag.culture);
    notifyListeners();
  }

  Future<void> addNewsToList(Uri url, List<News> newsList, Tag tag) async {
    final response = await http.get(url);
    final fetchedNews = json.decode(response.body)["articles"];
    for (var element in fetchedNews) {
      newsList.add(
        News(
          imageUrl: element["urlToImage"] ?? "https://picsum.photos/200",
          title: element["title"],
          description: element["description"] ?? element["title"],
          tag: tag,
          date: DateTime.parse(element["publishedAt"]),
        ),
      );
    }
  }
}
