import 'package:flutter/material.dart';
import 'book_provider.dart';
import 'main.dart';

//Login Page Runner
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Book Store Login',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Book Store Login'),
        ),
        body: LoginPageState(),
      ));
}

//Login Page State
class LoginPageState extends StatefulWidget {
  @override
  LoginPageComponents createState() => LoginPageComponents();
}

//Login Page UI
class LoginPageComponents extends State<LoginPageState> {
  //text style
  TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    //card for logo
    final logoDisplay = Row(children: <Widget>[
      Expanded(
        child: Icon(
        Icons.library_books,
        size: 50,
      )),
      Expanded(
        child: Text(
          'Book Store',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 20),
        ),
      )
    ]);

    //textfield for email
    final emailInput = TextField(
      obscureText: false,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Username / Email',
      ),
    );

    //textfield for password
    final passwordInput = TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
      ),
    );

    //login button
    final loginButton = Material(
      elevation: 5,
      color: Colors.blue,
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {
            Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => BookProvider(child: ShoppingCartApp()),
                ));
          },
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: textStyle,
          )),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                logoDisplay,
                SizedBox(height: 45),
                emailInput,
                SizedBox(height: 25),
                passwordInput,
                SizedBox(
                  height: 35,
                ),
                loginButton,
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
