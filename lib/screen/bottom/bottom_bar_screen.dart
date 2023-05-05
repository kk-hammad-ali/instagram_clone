import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/commons/colors.dart';

class BottomBarNavigation extends StatefulWidget {
  const BottomBarNavigation({super.key});

  @override
  State<BottomBarNavigation> createState() => _BottomBarNavigation();
}

class _BottomBarNavigation extends State<BottomBarNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Text('Home'),
    Text('Search'),
    Text('Add Post'),
    Text('Like'),
    Text('profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _currentIndex == 1 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: _currentIndex == 2 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: _currentIndex == 3 ? primaryColor : secondaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _currentIndex == 4 ? primaryColor : secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
