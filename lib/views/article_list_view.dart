import 'package:flutter/material.dart';
import 'package:nklcb/constants/app_colors.dart';
import 'package:nklcb/models/article_summary.dart';
import 'package:nklcb/views/article_card_view.dart';

class ArticleListView extends StatelessWidget {
  final bool isAppBarVisible;
  final String appBarTitle;
  final List<ArticleSummary> articles;

  const ArticleListView({
    super.key,
    this.isAppBarVisible = false,
    this.appBarTitle = 'Articles',
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBarVisible
          ? AppBar(
              title: Text(appBarTitle),
              backgroundColor: AppColors.primaryColor,
            )
          : null,
      body: ListView.builder(
        controller: PrimaryScrollController.of(context),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCardView(
              article: articles[index],
              color: AppColors.getCompanyColor(articles[index].company));
        },
      ),
    );
  }
}
