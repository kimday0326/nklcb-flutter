import 'package:flutter/material.dart';
import 'package:nklcb/article_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ArticleListPage(),
    Text('Keyword Page'),
    Text('Bookmark Page'),
    Text('Setting Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 상단 바를 제거
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Keyword',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF2DB400),
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
