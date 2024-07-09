import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nklcb/dto/article_summary.dart';
import 'package:nklcb/views/article_list_view.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List<ArticleSummary> articles = [];
  bool isLoading = false;
  int currentPage = 0;
  final int pageSize = 10;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchArticles();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchMoreArticles();
      }
    });
  }

  Future<void> fetchArticles() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(
        'http://52.79.94.51/api/v1/articles?page=$currentPage&size=$pageSize'));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData =
          json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> data = responseData['data'];
      setState(() {
        articles.addAll(data
            .map((item) => ArticleSummary(
                id: item['id'],
                title: item['title'],
                summary: item['summary'],
                company: item['company'],
                publishedAt: DateTime.parse(item['publishedAt'])))
            .toList());
        currentPage++;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load articles');
    }
  }

  Future<void> fetchMoreArticles() async {
    if (isLoading) return;
    await fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ArticleListView(
              articles: articles, scrollController: _scrollController),
          if (isLoading)
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
