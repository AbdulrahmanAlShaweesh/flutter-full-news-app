// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:news_app/Models/news_models.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel>? allNews;

  void get_news({required news}) {
    allNews = news;
  }

  List<NewsModel>? get listNews => allNews;
}
