// ignore_for_file: unused_import

class TotalResult {
  int totalResult;

  TotalResult({required this.totalResult});

  factory TotalResult.fromJson({jsonData}) {
    return TotalResult(
      totalResult: jsonData['totalResults'],
    );
  }
  @override
  String toString() {
    return 'total Resut => $totalResult ';
  }
}

class NewsModel {
  dynamic author;
  String title;
  String description;
  String url;
  dynamic urlToImage;
  String publishedAt;
  String content;
  Source name;

  NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.url,
    required this.name,
  });

  factory NewsModel.fromJson({required jsonData, required int index}) {
    return NewsModel(
      author: jsonData['articles'][index]['author'],
      title: jsonData['articles'][index]['title'],
      description: jsonData['articles'][index]['description'],
      urlToImage: jsonData['articles'][index]['urlToImage'],
      publishedAt: jsonData['articles'][index]['publishedAt'],
      content: jsonData['articles'][index]['content'],
      url: jsonData['articles'][index]['url'],
      name: Source.fromJson(jsonData: jsonData['articles'][index]['source']),
    );
  }

  @override
  String toString() {
    return 'author => $author , title => $title , descrition => $description , urlToImage => $urlToImage , publishedAt => $publishedAt , content => $content';
  }
}

class Source {
  String name;

  Source({required this.name});

  factory Source.fromJson({required jsonData}) {
    return Source(
      name: jsonData['name'],
    );
  }

  @override
  String toString() {
    return 'name => $name';
  }
}
