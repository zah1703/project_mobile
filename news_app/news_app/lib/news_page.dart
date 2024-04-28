import 'package:flutter/material.dart';
import 'package:news_app/client.dart';
import 'package:news_app/detail_newa_page.dart';
import 'package:news_app/response_articles.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late List<Article> listArticle;
  bool isLoading = false;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Beranda',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Eksplorasi',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Berlangganan',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    Text(
      'Kotak masuk',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future getListArticle() async {
    setState(() {
      isLoading = true;
    });

    listArticle = await Client.fetchArticle();
    print(listArticle);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getListArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : listArticle.isEmpty
              ? const Text("Tidak ada data")
              : Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Eksplorasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Berlangganan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Kotak masuk',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
