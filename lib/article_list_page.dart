import 'package:flutter/material.dart';
import 'package:nklcb/article_card.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({super.key});

  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> articles = [
      {
        'title': 'Golang, 그대들은 어떻게 할 것인가 - 1',
        'subtitle': '안녕하세요, 만 2년차 개발자로 클로바노트 서버를 개발하고 있는 김준하입니다.',
        'date': 'NAVER D2 | 2024.01.03',
        'color': '0xFF2DB400'
      },
      {
        'title': 'Dart의 새로운 기능 소개',
        'subtitle': 'Dart 언어의 최신 업데이트 내용과 사용법을 알아봅니다.',
        'date': 'NAVER D2 | 2024.01.02',
        'color': '0xFF2DB400'
      },
      {
        'title': 'Kotlin을 활용한 Android 개발',
        'subtitle':
            'Kotlin을 사용하여 Android 애플리케이션을 개발하는 방법을 소개합니다.ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ',
        'date': 'Kakao Tech | 2024.01.01',
        'color': '0xFFFFCD00'
      },
      {
        'title': 'Flutter로 만드는 멋진 UI',
        'subtitle': 'Flutter를 사용하여 매력적인 사용자 인터페이스를 구축하는 방법을 배워봅시다.',
        'date': 'LINE Engineering | 2024.01.04',
        'color': '0xFF06C755'
      },
      {
        'title': 'AI와 머신러닝의 미래',
        'subtitle': '인공지능과 머신러닝 기술의 최신 동향과 미래 전망을 살펴봅니다.',
        'date': 'Coupang Tech | 2024.01.05',
        'color': '0xFFF23C24'
      },
      {
        'title': 'Python으로 데이터 분석하기',
        'subtitle': 'Python을 사용하여 데이터 분석을 수행하는 방법에 대해 설명합니다.',
        'date': 'Woowa Tech | 2024.01.06',
        'color': '0xFF48D1CC'
      },
      {
        'title': 'React와 Redux를 사용한 웹 개발',
        'subtitle': 'React와 Redux를 활용하여 효율적인 웹 애플리케이션을 개발하는 방법을 다룹니다.',
        'date': 'NAVER D2 | 2024.01.07',
        'color': '0xFF2DB400'
      },
      {
        'title': 'Vue.js로 만드는 인터랙티브 웹 사이트',
        'subtitle': 'Vue.js를 사용하여 사용자 인터랙션이 풍부한 웹 사이트를 구축하는 방법을 배워봅시다.',
        'date': 'Kakao Tech | 2024.01.08',
        'color': '0xFFFFCD00'
      },
      {
        'title': 'Docker를 활용한 애플리케이션 배포',
        'subtitle': 'Docker를 사용하여 애플리케이션을 쉽고 빠르게 배포하는 방법을 설명합니다.',
        'date': 'LINE Engineering | 2024.01.09',
        'color': '0xFF06C755'
      },
      {
        'title': 'AWS를 활용한 클라우드 인프라 구축',
        'subtitle': 'AWS 서비스를 사용하여 클라우드 인프라를 설계하고 구축하는 방법을 다룹니다.',
        'date': 'Coupang Tech | 2024.01.10',
        'color': '0xFFF23C24'
      }
    ];

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleCard(
          title: articles[index]['title']!,
          subtitle: articles[index]['subtitle']!,
          date: articles[index]['date']!,
          color: Color(int.parse(articles[index]['color']!)),
        );
      },
    );
  }
}
