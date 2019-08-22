import 'package:flutter/material.dart';
import 'package:flutter_sample/shopping_cart_app.dart';

/// An enum representing different contents in home page.
enum Page {
  /// The list of available books.
  books,

  /// The list of favorite books.
  favorites
}

/// A home screen for the app.
///
/// [MyHome] is where users spend the most time. It includes a bottom
/// navigation bar with most commonly used options.
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = Page.books.index;

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

  Widget _buildBody() {
    Widget content;

    if (_selectedIndex == Page.books.index) {
      content = ShoppingCartApp();
    }

    return Center(
      child: content,
    );
  }

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
