import 'package:flutter/material.dart';

/// A class displaying the top section of the login page.
class LoginHeader extends StatelessWidget {
  /// Creates a top header.
  const LoginHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(context),
          _buildText(),
        ],
      );

  Widget _buildIcon(BuildContext context) {
    final size = MediaQuery.of(context).size.width / 5;

    return Icon(
      Icons.library_books,
      size: size,
    );
  }

  Widget _buildText() => const Padding(
        padding: EdgeInsets.only(top: 16, bottom: 64),
        child: Text(
          'The Library',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      );
}
