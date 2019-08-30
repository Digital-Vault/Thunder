import 'package:flutter_sample/login_form.dart';
import 'package:flutter_sample/login_header.dart';
import 'package:flutter_sample/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Header and form smoke test', (tester) async {
    await tester.pumpWidget(const LoginPage());

    final headerFinder = find.byType(LoginHeader);
    expect(headerFinder, findsOneWidget);

    final formFinder = find.byType(LoginForm);
    expect(formFinder, findsOneWidget);
  });
}
