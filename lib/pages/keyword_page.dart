import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nklcb/constants/app_colors.dart';
import 'package:nklcb/models/article_summary.dart';
import 'package:nklcb/views/article_list_view.dart';

class KeywordPage extends StatefulWidget {
  const KeywordPage({super.key});

  @override
  State<KeywordPage> createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  List<Map> keywords = [];
  List<ArticleSummary> articles = [];

  @override
  void initState() {
    super.initState();
    fetchKeywords();
  }

  Future<void> fetchKeywords() async {
    final response = await http.get(
      Uri.parse('http://52.79.94.51/api/v1/keywords'),
      headers: {'accept': '*/*'},
    );

    if (response.statusCode == 200) {
      setState(() {
        keywords = List<Map>.from(json.decode(utf8.decode(response.bodyBytes)))
          ..sort((a, b) => b['value'].compareTo(a['value']));
      });
    } else {
      throw Exception('Failed to load keywords');
    }
  }

  Future<void> fetchArticleByKeyword(String keyword) async {
    final response = await http.get(
      Uri.parse('http://52.79.94.51/api/v1/keywords/$keyword/articles'),
      headers: {'accept': '*/*'},
    );
    if (response.statusCode == 200) {
      setState(() {
        final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        articles = data.map((item) => ArticleSummary.fromJson(item)).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleListView(
              isAppBarVisible: true,
              appBarTitle: keyword,
              articles: articles,
            ),
          ),
        );
      });
    } else {
      throw Exception('Failed to load keywords');
    }
  }

  Color getColorForValue(int value) {
    int maxValue = keywords.isNotEmpty ? keywords[0]['value'] : 1;
    double opacity = value / maxValue;
    return Colors.green.withOpacity(opacity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 50 Keywords'),
        backgroundColor: AppColors.primaryColor,
        clipBehavior: Clip.antiAlias,
      ),
      body: keywords.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing: 8.0,
                children: keywords.map((word) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getColorForValue(word['value']),
                    ),
                    onPressed: () {
                      fetchArticleByKeyword(word['word']);
                    },
                    child: Text(
                      '${word['word']}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
