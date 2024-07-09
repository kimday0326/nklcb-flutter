class ArticleDetail {
  final int id;
  final String title;
  final String summary;
  final String content;
  final String author;
  final String link;
  final DateTime publishedAt;
  final String company;
  final List<String> keywords;

  ArticleDetail({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
    required this.author,
    required this.link,
    required this.publishedAt,
    required this.company,
    required this.keywords,
  });

  factory ArticleDetail.fromJson(Map<String, dynamic> json) {
    return ArticleDetail(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      content: json['content'],
      author: json['author'],
      link: json['link'],
      publishedAt: DateTime.parse(json['publishedAt']),
      company: json['company'],
      keywords: List<String>.from(json['keywords']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'content': content,
      'author': author,
      'link': link,
      'publishedAt': publishedAt.toIso8601String(),
      'company': company,
      'keywords': keywords,
    };
  }
}
