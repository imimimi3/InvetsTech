import 'package:investtech/pages/applist/ideas_home_page.dart';
import 'package:investtech/pages/markets/firstpage.dart';
import 'package:investtech/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:investtech/test/test.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    //Test(),
    IdeasHome(),
    FirstPage(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            elevation: 15.0,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb_outline),
                label: 'Идеи',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.trending_up),
                label: 'Котировки',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Профиль',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.orange,
            onTap: _onItemTapped,
          ),
          body: Container(
            color: Color(0xFFEEEEEE),
            child:Column(
              children: <Widget>[
                Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
              ],
            ),
          ),
        ));
  }
}
