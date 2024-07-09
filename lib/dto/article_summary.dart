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
}
