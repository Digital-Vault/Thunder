import 'package:flutter/material.dart';
import 'package:flutter_sample/shopping_cart_app.dart';

import 'book_provider.dart';

/// Height of the book cover image from NY Times API
const double bookCoverHeight = 495;

/// Width of the book cover image from NY Times API
const double bookCoverWidth = 328;

void main() => runApp(BookProvider(child: ShoppingCartApp()));
