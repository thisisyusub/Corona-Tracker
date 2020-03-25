class Article {
  final List<dynamic> article;

  Article(this.article);

  factory Article.fromJson(List<dynamic> json) {
    return Article(json);
  }

  @override
  String toString() => '''
  [
    Title: ${article[0]},
    Content: ${article[1]},
  ]
  ''';
}
