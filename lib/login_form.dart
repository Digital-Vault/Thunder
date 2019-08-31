import 'package:flutter/material.dart';

import 'book_provider.dart';
import 'my_home.dart';

/// A form consisting of email and password text fields along with a button.
class LoginForm extends StatefulWidget {
  /// Creates a login form.
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Form(
        key: _formKey,
        child: Column(
          children: [
            _buildEmail(),
            _buildPassword(),
            _buildLoginButton(),
          ],
        ),
      );

  Widget _buildEmail() => TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
        validator: _validateEmail,
      );

  String _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter your email address';
    }

    return null;
  }

  Widget _buildPassword() => Padding(
        padding: const EdgeInsets.only(top: 32, bottom: 64),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          validator: _validatePassword,
        ),
      );

  String _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter your password';
    }

    return null;
  }

  Widget _buildLoginButton() => ButtonTheme(
        minWidth: double.infinity,
        padding: const EdgeInsets.all(16),
        child: RaisedButton(
          onPressed: _onPressed,
          child: const Text('LOGIN', style: TextStyle(fontSize: 23)),
        ),
      );

  void _onPressed() {
    if (_formKey.currentState.validate()) {
      Navigator.pushReplacement(
        _formKey.currentContext,
        MaterialPageRoute<Widget>(
          builder: _buildRoute,
        ),
      );
    }
  }

  Widget _buildRoute(BuildContext context) => BookProvider(
        child: MyHome(),
      );
}
