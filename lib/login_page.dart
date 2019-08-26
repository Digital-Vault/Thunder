import 'package:flutter/material.dart';
import 'package:flutter_sample/login_header.dart';

import 'login_form.dart';

///Login Page Runner
class LoginPage extends StatelessWidget {
  /// Creates a login page.
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Book Store Login',
        home: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const LoginHeader(),
                  LoginForm(),
                ],
              ),
            ),
          ),
        ),
      );
}
