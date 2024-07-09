import 'package:flutter/material.dart';
import 'package:nklcb/constants/app_colors.dart';
import 'package:word_cloud/word_cloud.dart';

class KeywordPage extends StatefulWidget {
  const KeywordPage({super.key, required this.title});

  final String title;

  @override
  State<KeywordPage> createState() => _KeywordPageState();
}

class _KeywordPageState extends State<KeywordPage> {
  List<Map> wordList = <Map>[
    {'word': 'Apple', 'value': 100},
    {'word': 'Samsung', 'value': 60},
    {'word': 'Intel', 'value': 55},
    {'word': 'Tesla', 'value': 50},
    {'word': 'AMD', 'value': 40},
    {'word': 'Google', 'value': 35},
    {'word': 'Qualcomm', 'value': 31},
    {'word': 'Netflix', 'value': 27},
    {'word': 'Meta', 'value': 27},
    {'word': 'Amazon', 'value': 26},
    {'word': 'Microsoft', 'value': 25},
    {'word': 'Facebook', 'value': 23},
    {'word': 'Twitter', 'value': 20},
    {'word': 'GitHub', 'value': 18},
    {'word': 'Dart', 'value': 15},
    {'word': 'Flutter', 'value': 12},
    {'word': 'Android', 'value': 10},
    {'word': 'iOS', 'value': 8},
    {'word': 'Java', 'value': 6},
    {'word': 'Python', 'value': 4},
    {'word': 'JavaScript', 'value': 2},
  ];

  int count = 0;
  String selectedWord = '';

  @override
  Widget build(BuildContext context) {
    WordCloudData wcData = WordCloudData(data: wordList);
    WordCloudTap wordTaps = WordCloudTap();

    for (int i = 0; i < wordList.length; i++) {
      void tap() {
        setState(() {
          count += 1;
          selectedWord = wordList[i]['word'];
        });
      }

      wordTaps.addWordtap(wordList[i]['word'], tap);
    }

    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //   Text('Clicked Word: $selectedWord',
            //       style: const TextStyle(fontSize: 20)),
            //   Text('Clicked Count: $count', style: const TextStyle(fontSize: 20)),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return WordCloudTapView(
                    data: wcData,
                    wordtap: wordTaps,
                    mapwidth: constraints.maxWidth,
                    mapheight: constraints.maxHeight,
                    fontWeight: FontWeight.bold,
                    colorlist: AppColors.companyColors.values.toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
