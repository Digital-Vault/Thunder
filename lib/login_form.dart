import 'package:flutter/material.dart';

import 'book_provider.dart';
import 'my_home.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //textfield for email
    final emailInput = Container(
        // margin: const EdgeInsets.only(top: 25),
        child: TextField(
      // obscureText: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      ),
    ));

    //textfield for password
    final passwordInput = Container(
      margin: const EdgeInsets.only(top: 32, bottom: 64),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
        ),
      ),
    );

    //login button
    final loginButton = ButtonTheme(
      minWidth: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: RaisedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute<Widget>(
                  builder: (context) => BookProvider(child: MyHome()),
                ));
          },
          child: const Text('Login', style: TextStyle(fontSize: 20)),
        ),
      ),
    );

    return Column(
      children: [
        emailInput,
        passwordInput,
        loginButton,
      ],
    );
  }
}
