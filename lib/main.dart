/*
  BTR490 Test Flutter App
  Shopping Cart
  Group 02
*/

//packages
import 'dart:math';

import 'package:flutter/material.dart';

//executing function
void main() => (runApp(ShoppingCartApp()));

//main class that defines global themes and links other classes
class ShoppingCartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: ShoppingCart(),
    );
  }
}

//create a stateful widget from the list of items
class ShoppingCart extends StatefulWidget {
  @override
  ItemList createState() => ItemList();
}

//list of items for sale
class ItemList extends State {
  //build widgets together
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shopping Cart'),
        ),
        body: _buildAllItems());
  }

  //row widget containing data
  Widget _buildRowItem(int i) {
    var randomPrice = new Random();
    String item = "Item #" + i.toString();
    String price = "Price: \$" + randomPrice.nextInt(1000).toString();
    var itemRow =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(item),
      Text(price),
      Image.asset(
        'images/lake.jpg',
        width: 100,
        height: 100,
      ),
      IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetail(item, price)),
            );
          })
    ]);
    return itemRow;
  }

  //build list and put in dividers
  Widget _buildAllItems() {
    return ListView.builder(
        padding: const EdgeInsets.all(32.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return Divider();
          }
          return _buildRowItem(i);
        });
  }
}

//detail of item for sale
class ItemDetail extends StatelessWidget {
  //data
  String item = "AAA";
  String price = "BBB";

  ItemDetail(String item, String price) {
    this.item = item;
    this.price = price;
  }

  //build details screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.item)),
      body: Padding(padding: EdgeInsets.all(16.0), child: Text(this.price)),
    );
  }
}
