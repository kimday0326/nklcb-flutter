import 'package:flutter/material.dart';
import 'package:nklcb/constants/app_colors.dart';
import 'package:nklcb/dto/article_summary.dart';
import 'package:nklcb/views/article_card_view.dart';

class ArticleListView extends StatelessWidget {
  final List<ArticleSummary> articles;
  final ScrollController scrollController;
  const ArticleListView({
    super.key,
    required this.articles,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCardView(
            article: articles[index],
            color: AppColors.getCompanyColor(articles[index].company));
      },
    );
  }
}
