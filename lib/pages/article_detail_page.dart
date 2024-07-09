import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nklcb/dto/article_detail.dart';
import 'package:nklcb/utils/date_utils.dart';

class ArticleDetailPage extends StatefulWidget {
  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  late Future<ArticleDetail> articleDetailFuture;

  @override
  void initState() {
    super.initState();
    articleDetailFuture = fetchArticleDetail(widget.articleId);
  }

  Future<ArticleDetail> fetchArticleDetail(int id) async {
    final response =
        await http.get(Uri.parse('http://52.79.94.51/api/v1/articles/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      return ArticleDetail.fromJson(data);
    } else {
      throw Exception('Failed to load article');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              // 북마크 기능 추가
            },
          ),
          IconButton(
            icon: const Icon(Icons.link),
            onPressed: () async {
              // if (await canLaunch(article.originalLink)) {
              //   await launch(article.originalLink);
              // } else {
              //   // 오류 처리
              // }
            },
          ),
        ],
      ),
      body: FutureBuilder<ArticleDetail>(
        future: articleDetailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Article not found'));
          } else {
            final article = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "${article.company} | ${DateTimeUtils.formatDate(article.publishedAt)}",
                    style: TextStyle(color: Colors.grey[700], fontSize: 14.0),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
