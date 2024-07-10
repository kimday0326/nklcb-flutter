import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nklcb/constants/app_colors.dart';
import 'package:nklcb/models/article_summary.dart';
import 'package:nklcb/views/article_list_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late Future<List<ArticleSummary>> articleSummariesFuture;

  @override
  void initState() {
    super.initState();
    articleSummariesFuture = _fetchBookmarkedArticles();
  }

  Future<List<ArticleSummary>> _fetchBookmarkedArticles() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = prefs.getStringList('bookmarks') ?? [];

    if (bookmarks.isEmpty) {
      return [];
    }

    final ids = bookmarks.map(int.parse).join('&ids=');
    final url = 'http://52.79.94.51/api/v1/articles/summaries?ids=$ids';
    final response = await http.get(Uri.parse(url), headers: {'accept': '*/*'});

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes))['data'] as List;
      return data.map((json) => ArticleSummary.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load article summaries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarked Articles'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: FutureBuilder<List<ArticleSummary>>(
        future: articleSummariesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No bookmarks found'));
          } else {
            final articles = snapshot.data!;
            return ArticleListView(articles: articles);
          }
        },
      ),
    );
  }
}
