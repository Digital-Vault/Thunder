import 'package:flutter/material.dart';
import 'package:flutter_sample/theme.dart';

import 'login_page.dart';

/// A class that starts the application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: appTheme,
        home: const LoginPage(),
      );
}
