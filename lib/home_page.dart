import 'package:doctime/ui/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:doctime/ui/theme/theme.dart';
import 'package:doctime/ui/pages/tab_home/home_tab.dart';

class MyHomePage extends StatefulWidget {
  static final String pageName = 'homePage';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;

  // final List<BottomNavigationBarItem> _bottomNavigationBarItem = const [
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.home),
  //     label: 'Home',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.history),
  //     label: 'History',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.medical_information),
  //     label: 'Doctor',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.subscriptions),
  //     label: 'Subscription',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: Icon(Icons.menu),
  //     label: 'More',
  //   ),
  // ];

  final List<Tab> _tabBar = const [
    Tab(
      icon: Icon(Icons.home),
      text: 'Home',
    ),
    Tab(
      icon: Icon(Icons.history),
      text: 'History',
    ),
    Tab(
      icon: Icon(Icons.medical_information),
      text: 'Doctor',
    ),
    Tab(
      icon: Icon(Icons.subscriptions),
      text: 'Subscriptions',
    ),
    Tab(
      icon: Icon(Icons.menu),
      text: 'More',
    ),
  ];

  final List<Widget> _tabPage = [
    HomeTab(),
    Box1(),
    Box2(),
    Box3(),
    Box1(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBar.length,
      child: Scaffold(
        // bottomNavigationBar: BottomNavigationBar(
        //   items: _bottomNavigationBarItem,
        //   currentIndex: tabIndex,
        //   selectedItemColor: Colors.red,
        //   unselectedItemColor: Colors.blue,
        //   //fixedColor: Colors.green,
        //   onTap: (value) {
        //     tabIndex = value;
        //     setState(() {});
        //   },
        // ),
        //------------------------------------
        bottomNavigationBar: TabBar(
          labelColor: Colors.indigo,
          indicatorWeight: 4,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Color(0xDD613896), width: 4.0),
            insets: EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 70.0),
          ),
          tabs: _tabBar,
          indicatorSize: TabBarIndicatorSize.label,
          onTap: (value) => setState(() {
            tabIndex = value;
          }),
        ),
        body: _tabPage[tabIndex],
      ),
    );
  }
}
