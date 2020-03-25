class News {
  final String title;
  final String body;

  News({
    this.title,
    this.body,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() => '''
  {
    title: $title,
    body: $body,
  }
   ''';
}
