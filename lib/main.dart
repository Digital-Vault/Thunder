/*
  BTR490 Test Flutter App
  Shopping Cart
  Group 02
*/

//packages
import 'dart:math';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import "json_parsing.dart";
import "book.dart";
//executing function
void main() => (runApp(ShoppingCartApp()));

class ShoppingCartApp extends StatelessWidget {

  Future<List<Books>> books() async {
    var jsonData = await rootBundle.loadString('assets/test.json');
    Future<List<Books>> BookList = parseBooks(jsonData);
    return BookList;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',

      home: Scaffold(appBar: AppBar(title: Text('Book Store'),
      ),
          body: new FutureBuilder<List<Books>>(
          future: books(),
          builder: (context, snapshot){
            if (!snapshot.hasData)
              return new Container();
            List<Books> books = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(32.0),
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                Books book = books[index];
                return new Padding(padding: new EdgeInsets.all(10.0),
                    child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Text(book.title, textAlign: TextAlign.left, style: new TextStyle(fontSize: 20.0, color: Colors.black)),
                          ),
                          Expanded(
                            child: Text( "\$ " + book.price.toString(), textAlign: TextAlign.right, style: new TextStyle(fontSize: 20.0, color: Colors.black)),
                          ),
                        ]));
              },

            );
          }

      )
        )
      /*new FutureBuilder<List<Books>>(
        future: books(),
          builder: (context, snapshot){
            if (!snapshot.hasData)
              return new Container();
            List<Books> books = snapshot.data ?? [];
            return ListView.builder(
              padding: const EdgeInsets.all(32.0),
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                Books book = books[index];
                return new Padding(padding: new EdgeInsets.all(10.0),
                    child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Text(book.title, textAlign: TextAlign.left, style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                      Expanded(
                        child: Text(book.price.toString(), textAlign: TextAlign.right, style: new TextStyle(fontSize: 20.0, color: Colors.white)),
                      ),
                    ]));
              },

            );
          }

      ), */
    );
  }
}

//main class that defines global themes and links other classes
/*
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
*/
/*
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
  Future<List<Books>> books() async {
    var jsonData = await rootBundle.loadString('assets/test.json');
    Future<List<Books>> BookList = parseBooks(jsonData);
    return BookList;
  }
  //row widget containing data
  Widget _buildRowItem(int i){
    FutureBuilder<List<Books>>(future: books(),
        builder: (context, snapshot){
          if (!snapshot.hasData)
            return new Container(
              child: new Text("error"),
            );
          List<Books> books = snapshot.data ?? [];
          Books book = books[i];
        },
    );
    var randomPrice = new Random();
    String item = "Title: " + i.toString();
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
*/
