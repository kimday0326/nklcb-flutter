import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nklcb/constants/app_colors.dart';
import 'package:nklcb/constants/info_container.dart';
import 'package:nklcb/models/article_detail.dart';
import 'package:nklcb/utils/date_utils.dart';
import 'package:nklcb/views/article_content_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailPage extends StatefulWidget {
  final int articleId;

  const ArticleDetailPage({super.key, required this.articleId});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  bool isBookmarked = false;
  late SharedPreferences prefs;
  late List<String> bookmarks;
  late Future<ArticleDetail> articleDetailFuture;

  @override
  void initState() {
    super.initState();
    articleDetailFuture = _fetchArticleDetail(widget.articleId);
    _initPrefs();
  }

  Future<ArticleDetail> _fetchArticleDetail(int id) async {
    final response =
        await http.get(Uri.parse('http://52.79.94.51/api/v1/articles/$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(utf8.decode(response.bodyBytes))['data'];
      return ArticleDetail.fromJson(data);
    } else {
      throw Exception('Failed to load article');
    }
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    bookmarks = prefs.getStringList('bookmarks') ?? [];
    setState(() {
      isBookmarked = bookmarks.contains(widget.articleId.toString());
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  void _changeBookmarkState() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
    prefs.setStringList('bookmarks', bookmarks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
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
            return _buildArticleContent(article);
          }
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Article'),
      backgroundColor: AppColors.primaryColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_border),
          onPressed: () async {
            _changeBookmarkState();
            if (isBookmarked) {
              bookmarks.add(widget.articleId.toString());
            } else {
              bookmarks.remove(widget.articleId.toString());
            }
            await prefs.setStringList('bookmarks', bookmarks);
          },
        ),
        IconButton(
          icon: const Icon(Icons.link),
          onPressed: () async {
            final article = await articleDetailFuture;
            _launchUrl(article.link);
          },
        ),
      ],
    );
  }

  Widget _buildArticleContent(ArticleDetail article) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
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
            infoContainer,
            ArticleContentView(content: article.content),
          ],
        ),
      ),
    );
  }
}
