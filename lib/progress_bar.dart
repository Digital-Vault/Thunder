//progress bar

import 'package:flutter/material.dart';

const double _kMyLinearProgressIndicatorHeight = 6.0;

class LinearProgressBar extends LinearProgressIndicator
    implements PreferredSizeWidget {
  //constructor
  LinearProgressBar({
    Key key,
    double value,
    Color backgroundColor,
    Animation<Color> valueColor,
  }) :
        //call parent constructor
        super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
        ) {
    preferredSize = Size(double.infinity, _kMyLinearProgressIndicatorHeight);
  }

  @override
  Size preferredSize;
}

/*
Example implementation
            appBar: AppBar(
              title: Text('Book Store'),
              bottom: LinearProgressBar(
                backgroundColor: Colors.orange,
              ),
            ),
*/
