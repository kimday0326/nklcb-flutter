class ArticleSummary {
  final int id;
  final String title;
  final String summary;
  final String company;
  final DateTime publishedAt;

  const ArticleSummary({
    required this.id,
    required this.title,
    required this.summary,
    required this.company,
    required this.publishedAt,
  });

  factory ArticleSummary.fromJson(Map<String, dynamic> json) {
    return ArticleSummary(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      publishedAt: DateTime.parse(json['publishedAt']),
      company: json['company'],
    );
  }
}
