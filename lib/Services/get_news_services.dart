// ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/Models/news_models.dart';

class NewsServices {
  Future<List<NewsModel>> getNewsServices({required String endPoins}) async {
    http.Response response = await http.get(
      Uri.parse(
        'https://newsapi.org/v2/everything?q=$endPoins&apiKey=8fd69c3bfc9e4cfc9733a03b46298ca6',
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<NewsModel> listArticals = [];

      for (int i = 0; i < data['articles'].length; i++) {
        listArticals.add(
          NewsModel.fromJson(jsonData: data, index: i),
        );
      }
      print(listArticals);
      return listArticals;
    } else {
      throw Exception('there was an error');
    }
  }
}
