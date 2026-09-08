import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onebuttonapp/main.dart';

void main() {
  testWidgets('Button can be pressed without changing the screen',
      (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(FilledButton), findsOneWidget);
    expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
        isNotNull);

    await tester.tap(find.text('Press me'));
    await tester.pumpAndSettle();

    expect(find.text('Press me'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
