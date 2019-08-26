import 'package:flutter/material.dart';

/// A widget for when no favorite books exists.
class NoFavorites extends StatelessWidget {
  /// Creates a widget that displays the message.
  const NoFavorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: _mainColumn(),
      );

  Widget _mainColumn() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_emptyFavoriteImage(), _emptyFavoriteText()],
      );

  Widget _emptyFavoriteImage() => Image.asset(
        'assets/girl_like.png',
        scale: 4,
        fit: BoxFit.cover,
      );

  Widget _emptyFavoriteText() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text('Try Liking A book And It Will Show Up Here.'),
        ),
      );
}
