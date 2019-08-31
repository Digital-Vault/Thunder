import 'package:flutter/material.dart';
import 'package:flutter_sample/login_form.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const emailErrorMessage = 'Please enter your email address';
  const passwordErrorMessage = 'Please enter your password';

  Widget widget;

  setUp(() {
    widget = MaterialApp(
      home: Scaffold(
        body: const LoginForm(),
      ),
    );
  });

  testWidgets('Form fields and button smoke test', (tester) async {
    await tester.pumpWidget(widget);

    final formFieldsFinder = find.byType(TextFormField);
    expect(formFieldsFinder, findsNWidgets(2));

    final buttonFinder = find.byType(RaisedButton);
    expect(buttonFinder, findsOneWidget);

    const buttonText = 'LOGIN';
    final buttonTextFinder = find.text(buttonText);
    expect(buttonTextFinder, findsOneWidget);
  });

  testWidgets('Email and password error message smoke test', (tester) async {
    await tester.pumpWidget(widget);

    final loginButtonFinder = find.text('LOGIN');
    await tester.tap(loginButtonFinder);

    await tester.pump();

    final emailMessageFinder = find.text(emailErrorMessage);
    expect(emailMessageFinder, findsOneWidget);

    final passwordMessageFinder = find.text(passwordErrorMessage);
    expect(passwordMessageFinder, findsOneWidget);
  });
}
