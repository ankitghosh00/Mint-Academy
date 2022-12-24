import 'package:flutter/material.dart';

import 'package:mintacademy/screens/event.dart';

import 'package:mintacademy/screens/feeds.dart';
import 'package:mintacademy/screens/home.dart';
import 'package:mintacademy/screens/course.dart';
import 'package:mintacademy/screens/user.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/BottomBarScreen';

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

WebViewController _webViewController;

class _BottomBarScreenState extends State<BottomBarScreen> {
  // List _pages = [
  //   HomeScreen(),
  //   FeedsScreen(),
  //   SearchScreen(),
  //   CartScreen(),
  //   UserScreen(),
  // ];

  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': HomeScreen(), 'title': 'Home Screen'},
      {'page': FeedsScreen(), 'title': 'Pricing screen'},
      {'page': WebViewExample(), 'title': 'Course Screen'},
      {'page': eventScreen(), 'title': 'Event Screen'},
      {'page': UserInfo(), 'title': 'User Screen'}
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        notchMargin: 3,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(width: 0.5),
          )),
          child: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.green,
            currentIndex: _selectedIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                tooltip: 'Home',
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pix_rounded),
                tooltip: 'Price',
                label: 'Price',
              ),
              BottomNavigationBarItem(
                activeIcon: null,
                icon: Icon(null),
                //   color: Colors.transparent,
                tooltip: 'Course',
                label: 'Course',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.run_circle_rounded),
                tooltip: 'Event',
                label: 'Event',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                tooltip: 'User',
                label: 'User',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        tooltip: 'Course',
        elevation: 3,
        child: (Icon(Icons.auto_stories_rounded)),
        onPressed: () {
          setState(() {
            _selectedIndex = 2;
          });
        },
      ),
    );
  }
}
