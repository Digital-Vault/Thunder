import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
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

  Widget _buildText() => Padding(
        padding: const EdgeInsets.only(top: 13, bottom: 64),
        child: Text(
          'BTR490 Books',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
      );
}
