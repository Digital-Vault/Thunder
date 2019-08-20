import 'package:flutter/material.dart';

/// A home screen for the app.
///
/// [MyHome] is where users spend the most time. It includes a bottom
/// navigation bar with most commonly used options.
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Shopping Cart',
        home: _buildScaffold(),
      );

  Widget _buildScaffold() => Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigation(),
      );

  Widget _buildAppBar() => AppBar(
        title: const Text('Book Store'),
      );

  Widget _buildBody() => Center();

  BottomNavigationBar _buildBottomNavigation() => BottomNavigationBar(
        items: [
          _buildHomeIcon(),
          _buildFavoriteIcon(),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      );

  BottomNavigationBarItem _buildHomeIcon() => BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: const Text('Home'),
      );

  BottomNavigationBarItem _buildFavoriteIcon() => BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        title: const Text('Favorites'),
      );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
