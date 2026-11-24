import 'package:flutter_test/flutter_test.dart';
import 'package:study_planner/main.dart';

void main() {
  testWidgets('Study Planner displays study goals',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('My Study Goals'), findsOneWidget);
    expect(find.text('Flutter'), findsOneWidget);
    expect(find.text('Web Technology'), findsOneWidget);
    expect(find.text('Software Architecture'), findsOneWidget);
  });
}