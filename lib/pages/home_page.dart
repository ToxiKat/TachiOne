import 'package:flutter/material.dart';
import 'package:tachione/pages/main/browse_page.dart';
import 'package:tachione/pages/main/library_page.dart';

class HomePage extends StatefulWidget {
  ///Home Page for TachiOne
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<Widget> allPages = <Widget>[
    const LibraryPage(),
    const BrowsePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allPages.elementAt(currentPage),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark_outlined),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: "Browse",
          ),
        ],
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
