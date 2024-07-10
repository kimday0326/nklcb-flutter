import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleContentView extends StatelessWidget {
  final String content;

  const ArticleContentView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    bool isHtml = content.contains(RegExp(r'<[^>]+>'));

    if (isHtml) {
      return Html(
        data: content,
        onLinkTap: (url, _, __) {
          if (url != null) {
            launchUrl(Uri.parse(url));
          }
        },
        style: {"body": Style(margin: Margins.all(0))},
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          content,
          style: const TextStyle(
            fontSize: 16.0,
            height: 2.0,
          ),
        ),
      );
    }
  }
}
