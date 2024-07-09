import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nklcb/article_card.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  List<Map<String, String>> articles = [];
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
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> data = responseData['data'];
      setState(() {
        articles.addAll(data
            .map((item) => {
                  'title': item['title'],
                  'subtitle': item['summary'],
                  'date': item['publishedAt'],
                  'color': '0xFF06C755' // 기본 색상 지정
                })
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
      appBar: AppBar(
        title: const Text('Article List'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return ArticleCard(
                title: articles[index]['title']!,
                subtitle: articles[index]['subtitle']!,
                date: articles[index]['date']!,
                color: Color(int.parse(articles[index]['color']!)),
              );
            },
          ),
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
