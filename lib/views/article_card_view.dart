import 'package:flutter/material.dart';
import 'package:nklcb/dto/article_summary.dart';

class ArticleCardView extends StatelessWidget {
  final ArticleSummary article;
  final Color color;

  const ArticleCardView(
      {super.key, required this.article, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: InkWell(
        onTap: () {
          print('Card tapped.');
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 2.0,
                  color: color,
                  margin: const EdgeInsets.only(right: 8.0),
                ),
                Expanded(
                  flex: 15,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${article.company} | ${article.publishedAt}",
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 12.0),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        article.summary,
                        style:
                            TextStyle(color: Colors.grey[900], fontSize: 14.0),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
